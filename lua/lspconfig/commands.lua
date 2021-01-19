local ui = require "lspconfig/ui"
local utils = require "lspconfig/utils"
local devices = require "lspconfig/devices"
local dev_log = require "lspconfig/dev_log"

local api = vim.api
local jobstart = vim.fn.jobstart
local jobstop = vim.fn.jobstop

local M = {}

local state = {
  job_id = nil
}

---@param lines table
local function has_device_conflict(lines)
  for _, line in pairs(lines) do
    if line then
      -- match the error string returned if multiple devices are matched
      return line:match("More than one device connected") ~= nil
    end
  end
  return false
end

local function on_flutter_run_error(result)
  return function(_, data, _)
    for _, item in pairs(data) do
      table.insert(result.data, item)
    end
  end
end

local function on_flutter_run_data(result, opts)
  return function(job_id, data, _)
    -- only check if there is a conflict if we haven't already seen this message
    result.has_conflict = result.has_conflict or has_device_conflict(data)
    if result.has_conflict then
      vim.list_extend(result.data, data)
    else
      dev_log.log(job_id, data, opts)
    end
  end
end

--- Parse a list of lines looking for devices
--- return the parsed list and the found devices if any
---@param result table
local function add_device_options(result)
  local edited = {}
  local win_devices = {}
  local highlights = {}
  for index, line in pairs(result.data) do
    local device = devices.parse(line)
    if device then
      win_devices[tostring(index)] = device
      local name = utils.display_name(device.name, device.platform)
      table.insert(edited, name)
      utils.add_device_highlights(highlights, name, index, device)
    else
      table.insert(edited, line)
    end
  end
  return edited, win_devices, highlights
end

local function on_flutter_run_exit(result)
  return function(_, _, name)
    if result.has_conflict and result.data then
      local edited, win_devices, highlights = add_device_options(result)
      ui.popup_create(
        "flutter run (" .. name .. "): ",
        edited,
        function(buf, _)
          vim.b.devices = win_devices
          ui.add_highlights(buf, highlights)
          -- we have handled this conflict by giving the user a
          result.has_conflict = false
          api.nvim_buf_set_keymap(
            buf,
            "n",
            "<CR>",
            ":lua __flutter_tools_select_device()<CR>",
            {silent = true, noremap = true}
          )
        end
      )
    end
  end
end

function _G.__flutter_tools_select_device()
  local win_devices = vim.b.devices
  if not win_devices then
    vim.cmd [[echomsg "Sorry there is no device on this line"]]
    return
  end
  local lnum = vim.fn.line(".")
  local device = win_devices[lnum] or win_devices[tostring(lnum)]
  if device then
    M.run(device)
  end
  api.nvim_win_close(0, true)
end

function M.run(device, opts)
  opts = opts or {}
  local cmd = "flutter run"
  if M.job_id then
    return utils.echomsg("Flutter is already running!")
  end
  if device then
    local id = device.id or device.device_id
    if id then
      cmd = cmd .. " " .. id
    end
  end
  ui.notify {"Starting flutter project..."}
  local result = {
    has_conflict = false,
    data = {}
  }
  state.job_id =
    jobstart(
    cmd,
    {
      on_stdout = on_flutter_run_data(result, opts),
      on_exit = on_flutter_run_exit(result),
      on_stderr = on_flutter_run_error(result)
    }
  )
end

local function on_pub_get(result)
  return function(_, data, channel)
    if not channel == "stderr" and result.error then
      result.error = true
    end
    local str = table.concat(data, "")
    if data and (str and str:len() > 0) then
      table.insert(result.data, str)
    end
  end
end

local function on_pub_get_exit(result)
  ui.notify(result.data)
end

local pub_get_job = nil

function M.pub_get()
  local result = {
    error = false,
    data = {}
  }
  if not pub_get_job then
    pub_get_job =
      jobstart(
      "flutter pub get",
      {
        stdout_buffered = true,
        stderr_buffered = true,
        on_stdout = on_pub_get(result),
        on_stderr = on_pub_get(result),
        on_exit = function()
          pub_get_job = nil
          on_pub_get_exit(result)
        end
      }
    )
  end
end

function M.quit()
  jobstop(state.log.job_id)
  state.log.job_id = nil
end

function _G.__flutter_tools_close(buf)
  vim.cmd("bw " .. buf)
end

return M
