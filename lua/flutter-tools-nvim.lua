require('dap').continue()
-- alternatively you can override the default configs
require("flutter-tools").setup {
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = true,
  },
  flutter_path = "/opt/flutter/bin/flutter", -- <-- this takes priority over the lookup
  flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "ErrorMsg", -- highlight for the closing tag
    prefix = ">", -- character to use for close tag e.g. > Widget
    enabled = true, -- set to false to disable
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
  },
  lsp = {
    on_attach = my_custom_on_attach,
    capabilities = my_custom_capabilities, -- e.g. lsp_status capabilities
    --- OR you can specify a function to deactivate or change or control how the config is created
    capabilities = function(config)
      config.specificThingIDontWant = false
      return config
    end,
    settings = {
      showTodos = true,
      completeFunctionCalls = true -- NOTE: this is WIP and doesn't work currently
    }
  }
}

