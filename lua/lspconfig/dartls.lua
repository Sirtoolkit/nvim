local util = require 'lspconfig/util'
local configs = require 'lspconfig/configs'
local labels = require "lspconfig/labels"
local server_name = "dartls"
local bin_name = "dart"

local analysis_server_snapshot_path = function()
    return os.getenv("HOME") .. "/development/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot"
end

configs[server_name] = {
  default_config = {
    cmd = {bin_name, analysis_server_snapshot_path(), "--lsp"};
    filetypes = {"dart"};
    root_dir = util.root_pattern("pubspec.yaml");
    flags = {allow_incremental_sync = true},
    init_options = {
      closingLabels = true,
      outline = true,
      flutterOutline = true
    },
    handlers = {
       ["dart/textDocument/publishClosingLabels"] = labels.closing_tags(),
    }
  };

  docs = {
    package_json = "https://raw.githubusercontent.com/Dart-Code/Dart-Code/master/package.json";
    description = [[
https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server/tool/lsp_spec
Language server for dart.
]];
    default_config = {
      root_dir = [[root_pattern("pubspec.yaml")]];
    };
  };
};

