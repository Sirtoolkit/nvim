require'lspconfig'.dartls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.jdtls.setup{}

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
