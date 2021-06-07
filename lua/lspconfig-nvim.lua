require'lspconfig'.dartls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.jdtls.setup{}
require'lspconfig'.kotlin_language_server.setup {}

require'lspconfig'.tsserver.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.intelephense.setup{}
require'lspconfig'.dockerls.setup{}

require'dependency_assist'.setup{}

require'lspinstall'.setup() -- important

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
