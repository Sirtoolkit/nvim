local util = require 'lspconfig/util'
local configs = require 'lspconfig/configs'
local labels = require "lspconfig/labels"
local server_name = "dartls"
local bin_name = "dart"

local options = configs.options or {}

local find_dart_sdk_root_path = function()
  if vim.fn["executable"]("flutter") == 1 then
    local flutter_path = vim.fn["resolve"](vim.fn["exepath"]("flutter"))
    local flutter_bin = vim.fn["fnamemodify"](flutter_path, ":h")
    -- return flutter_bin.."/cache/dart-sdk/bin/dart"
    return os.getenv("HOME") .. "/snap/flutter/common/flutter/bin/cache/dart-sdk/bin/dart"
  elseif vim.fn["executable"]("dart") == 1 then
    return vim.fn["resolve"](vim.fn["exepath"]("dart"))
  else
    return ''
  end
end

local analysis_server_snapshot_path = function()
  local dart_sdk_root_path = vim.fn["fnamemodify"](find_dart_sdk_root_path(), ":h")
  local snapshot = dart_sdk_root_path.."/snapshots/analysis_server.dart.snapshot"

  if vim.fn["has"]("win32") == 1 or vim.fn["has"]("win64") == 1 then
    snapshot = snapshot:gsub("/", "\\")
  end

  -- return snapshot
  return os.getenv("HOME") .. "/snap/flutter/common/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot"
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
      ["dart/textDocument/publishClosingLabels"] = labels.closing_tags(options.closing_tags),
      -- ["dart/textDocument/publishOutline"] = outline.document_outline(options.outline)
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
