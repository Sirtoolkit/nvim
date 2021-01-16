local lspconfig = require('lspconfig')
local flutter = require('flutter-tools')
lspconfig.dartls.setup {
    flags = {allow_incremental_sync = true},
    init_options = {
    closingLabels = true,
    outline = true,
    flutterOutline = true
  },
  on_attach = on_attach,
  handlers = {
    ['dart/textDocument/publishClosingLabels'] = flutter.closing_tags,
    ['dart/textDocument/publishOutline'] = flutter.outline
  }
}
