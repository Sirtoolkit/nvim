CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

O = {
    database = {save_location = '~/.config/nvsirnada_db', auto_execute = 1},
    python = {
        linter = '',
        -- @usage can be 'yapf', 'black'
        formatter = 'black',
        autoformat = true,
        isort = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
		analysis = {type_checking = "basic", auto_search_paths = true, use_library_code_types = true}
    },
    dart = {sdk_path = '/opt/dart-sdk/bin/snapshots/analysis_server.dart.snapshot'},
    lua = {
        -- @usage can be 'lua-format'
        formatter = 'lua-format',
        autoformat = true,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    tsserver = {
        -- @usage can be 'eslint'
        linter = 'eslint',
        -- @usage can be 'prettier'
        formatter = 'prettier',
        autoformat = true,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    json = {
        -- @usage can be 'prettier'
        formatter = 'prettier',
        autoformat = true,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    clang = {diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}},
    css = {formatter = '', autoformat = true, virtual_text = true},
  }

require'lspconfig'.dockerls.setup{}

require'dependency_assist'.setup{}

local config = require'lspconfig'.jdtls.document_config
require'lspconfig/configs'.jdtls = nil -- important, unset the loaded config again
-- config.default_config.cmd[1] = "./node_modules/.bin/bash-language-server"

-- 2. extend the config with an install_script and (optionally) uninstall_script
require'lspinstall/servers'.jdtls = vim.tbl_extend('error', config, {
    -- lspinstall will automatically create/delete the install directory for every server
    install_script = [[
      git clone https://github.com/eclipse/eclipse.jdt.ls.git
      cd eclipse.jdt.ls
      ./mvnw clean verify
  ]],
    uninstall_script = nil -- can be omitted
})

require'lspinstall/servers'.kotlin = vim.tbl_extend('error', config, {
    install_script = [[
      git clone https://github.com/fwcd/kotlin-language-server.git language-server
      cd language-server
	  ./gradlew :server:installDist
  ]],
    uninstall_script = nil -- can be omitted
})

require'lspinstall'.setup()

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end


vim.fn.sign_define('LspDiagnosticsSignError', {text=' ', texthl='LspDiagnosticsSignError',linehl='', numhl=''})
vim.fn.sign_define('LspDiagnosticsSignWarning', {text=' ', texthl='LspDiagnosticsSignWarning', linehl='', numhl=''})
vim.fn.sign_define('LspDiagnosticsSignInformation', {text=' ', texthl='LspDiagnosticsSignInformation', linehl='', numhl=''})
vim.fn.sign_define('LspDiagnosticsSignHint', {text=' ', texthl='LspDiagnosticsSignHint', linehl='', numhl=''})

-- 
-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    "   Text ",
    "   Method",
    "   Function",
    "   Constructor",
    " ﴲ  Field",
    "[] Variable",
    "   Class",
    " ﰮ  Interface",
    "   Module",
    " 襁 Property",
    "   Unit",
    "   Value",
    " 練 Enum",
    "   Keyword",
    " ﬌  Snippet",
    "   Color",
    "   File",
    "   Reference",
    "   Folder",
    "   EnumMember",
    " ﲀ  Constant",
    " ﳤ  Struct",
    "   Event",
    "   Operator",
    "   TypeParameter"
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "",
      spacing = 0,
    },
    signs = true,
    underline = true,
  }
)

-- vimls 
require'lspconfig'.vimls.setup {
    cmd = {DATA_PATH .. "/lspinstall/vim/node_modules/.bin/vim-language-server", "--stdio"},
    on_attach = require'lspconfig'.common_on_attach
}

-- clang
require'lspconfig'.clangd.setup {
    cmd =  {DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd"},
    on_attach = require'lspconfig'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.clang.diagnostics.virtual_text,
            signs = O.clang.diagnostics.signs,
            underline = O.clang.diagnostics.underline,
            update_in_insert = true
        })
    }
}

-- cssls
require'lspconfig'.cssls.setup {
    cmd = {
        "node", DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
        "--stdio"
    },
    on_attach = require'lspconfig'.common_on_attach
}

-- tsserver
require'lspconfig'.tsserver.setup {
    cmd = {DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server", "--stdio"},
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    on_attach = require'lspconfig'.tsserver_on_attach,
    -- This makes sure tsserver is not used for formatting (I prefer prettier)
    -- on_attach = require'lsp'.common_on_attach,
    root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    settings = {documentFormatting = false},
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.tsserver.diagnostics.virtual_text,
            signs = O.tsserver.diagnostics.signs,
            underline = O.tsserver.diagnostics.underline,
            update_in_insert = true

        })
    }
}

-- python
require'lspconfig'.pyright.setup {
    cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    on_attach = require'lspconfig'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.python.diagnostics.virtual_text,
            signs = O.python.diagnostics.signs,
            underline = O.python.diagnostics.underline,
            update_in_insert = true
        })
    },
	 settings = {
      python = {
        analysis = {
		  typeCheckingMode = O.python.analysis.type_checking,
		  autoSearchPaths = O.python.analysis.auto_search_paths,
          useLibraryCodeForTypes = O.python.analysis.use_library_code_types
        }
      }
    }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- html 
require'lspconfig'.html.setup {
    cmd = {"node", DATA_PATH .. "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js", "--stdio"},
    on_attach = require'lspconfig'.common_on_attach,
    capabilities = capabilities
}

-- dart
require'lspconfig'.dartls.setup{
    cmd = { "dart", O.dart.sdk_path, "--lsp" },
    on_attach = require'lspconfig'.common_on_attach,
    init_options = {
      closingLabels = true,
      flutterOutline = true,
      onlyAnalyzeProjectsWithOpenFiles = false,
      outline = true,
      suggestFromUnimportedLibraries = true
    }
}

-- java
local bundles = {
    vim.fn.glob(
        CONFIG_PATH.."/.debuggers/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
};

local on_attach = function(client, bufr)
    require('jdtls').setup_dap()
    require'lspconfig'.common_on_attach(client, bufr)
end

require('jdtls').start_or_attach({
    cmd = {"java-lsp"},
    on_attach = on_attach,
    root_dir = require('jdtls.setup').find_root({'build.gradle', 'pom.xml', '.git'}),
    init_options = {bundles = bundles}
})

-- kotlin
local util = require 'lspconfig/util'

local bin_name = DATA_PATH .. "/lspinstall/kotlin/language-server/server/build/install/server/bin/kotlin-language-server"
if vim.fn.has('win32') == 1 then
  bin_name = bin_name..".bat"
end

local root_files = {
  'settings.gradle',       -- Gradle (multi-project)
  'settings.gradle.kts',   -- Gradle (multi-project)
  'build.xml',             -- Ant
  'pom.xml',               -- Maven
}

local fallback_root_files = {
  'build.gradle',          -- Gradle
  'build.gradle.kts',      -- Gradle
}

require'lspconfig'.kotlin_language_server.setup {
    cmd = {bin_name},
    on_attach = require'lspconfig'.common_on_attach,
    root_dir = function(fname)
      return util.root_pattern(unpack(root_files))(fname) or
      util.root_pattern(unpack(fallback_root_files))(fname)
    end
}


-- lua
local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    on_attach = require'lspconfig'.common_on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
                maxPreload = 10000
            }
        }
    }
}
-- json
require'lspconfig'.jsonls.setup {
    cmd = {
        "node", DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
        "--stdio"
    },
    on_attach = require'lspconfig'.common_on_attach,

    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
        }
    }
}
