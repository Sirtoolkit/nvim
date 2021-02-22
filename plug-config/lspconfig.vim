lua require'lspconfig'.dartls.setup{}
lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.jdtls.setup{}

lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.vimls.setup{}
lua require'lspconfig'.cssls.setup{}
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.html.setup{}
lua require'lspconfig'.intelephense.setup{}
lua require'lspconfig'.bashls.setup{}

lua require'dependency_assist'.setup{}

lua << EOF
require("flutter-tools").setup {
  closing_tags = {
    highlight = "ErrorMsg",
    prefix = ">"
  }
}
EOF

set completeopt=menu,menuone,noselect

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>

nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e :Lspsaga lsp_jump_diagnostic_next<CR>
nnoremap <silent> ]e :Lspsaga lsp_jump_diagnostic_prev<CR>
