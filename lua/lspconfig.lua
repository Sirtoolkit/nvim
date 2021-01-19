local commands = require "lspconfig/commands"
local dev_log = require "lspconfig/dev_log"
local outline = require "lspconfig/outline"
local emulators = require "lspconfig/emulators"
local configs = require 'lspconfig/configs'
local lspui = require 'lspconfig/_lspui'
local ui = require "lspconfig/ui"
local utils = require "lspconfig/utils"

local api = vim.api
local jobstart = vim.fn.jobstart

local defaults = {
  outline = {
    open_cmd = "vnew"
  }
}

local M = {
  util = require 'lspconfig/util';
  outline = outline.document_outline(),
  open_outline = outline.open(defaults.outline),
  emulators = emulators.list,
  run = commands.run,
  pub_get = commands.pub_get,
  reload = dev_log.reload,
  restart = dev_log.restart,
  quit = dev_log.quit,
  visual_debug = dev_log.visual_debug,
}

M._root = {}

function M.available_servers()
  return vim.tbl_keys(configs)
end

function M.installable_servers()
  print("deprecated, see https://github.com/neovim/neovim/wiki/Following-HEAD")
end

-- Called from plugin/lspconfig.vim because it requires knowing that the last
-- script in scriptnames to be executed is lspconfig.
function M._root._setup()
  M._root.commands = {
  FlutterRun= {
      function ()
        vim.cmd("lua require('lspconfig').run()" )
      end
    };

  FlutterPubGet= {
      function ()
        vim.cmd("lua require('lspconfig').pub_get()" )
      end
    };

  FlutterReload = {
      function ()
        vim.cmd("lua require('lspconfig').reload()" )
      end
    };

  FlutterRestart = {
      function ()
        vim.cmd("lua require('lspconfig').restart()" )
      end
    };

  FlutterQuit = {
      function ()
        vim.cmd("lua require('lspconfig').quit()" )
      end
    };

  FlutterDevLog = {
      function ()
        vim.cmd("lua require('lspconfig').visual_debug()" )
      end
    };

 FlutterOutline = {
      function ()
        vim.cmd("lua require('lspconfig').open_outline()" )
      end
    };

  FlutterEmulators= {
      function ()
        vim.cmd("lua require('lspconfig').emulators()" )
      end
    };
  };

  M.util.create_module_commands("_root", M._root.commands)
end

local function setup_autocommands()
  utils.augroup(
    "FlutterToolsHotReload",
    {
      {
        events = {"BufWritePost"},
        targets = {"*.dart"},
        command = "lua require('lspconfig').reload(true)"
      },
      {
        events = {"BufWritePost"},
        targets = {"*/pubspec.yaml"},
        command = "lua require('lspconfig').pub_get()"
      },
      {
        events = {"BufEnter"},
        targets = {dev_log.filename},
        command = "lua require('lspconfig')._resurrect_log()"
      }
    }
  )
end

local mt = {}
function mt:__index(k)
  if configs[k] == nil then
    require('lspconfig/'..k)
  end
  return configs[k]
end

-- function M.setup(prefs)
--   setup_autocommands()
-- end

  setup_autocommands()
return setmetatable(M, mt)
-- vim:et ts=2 sw=2
