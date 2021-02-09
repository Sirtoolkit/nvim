lua require'lspconfig'.dartls.setup{}
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.vimls.setup{}
lua require'lspconfig'.cssls.setup{}
lua require'dependency_assist'.setup{}
lua require'flutter-tools'.setup{}
lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.jdtls.setup{}

lua << EOF
        vim.fn.sign_define('LspDiagnosticsSignError', {text='', texthl='LspDiagnosticsSignError',linehl='', numhl=''})
        vim.fn.sign_define('LspDiagnosticsSignWarning', {text='', texthl='LspDiagnosticsSignWarning', linehl='', numhl=''})
        vim.fn.sign_define('LspDiagnosticsSignInformation', {text='', texthl='LspDiagnosticsSignInformation', linehl='', numhl=''})
        vim.fn.sign_define('LspDiagnosticsSignHint', {text='', texthl='LspDiagnosticsSignHint', linehl='', numhl=''})
EOF

autocmd BufNewFile,BufRead *.cpp,*.html,*.js,*.ts,*.java let g:completion_enable_snippet = 'UltiSnips'
let g:UltiSnipsExpandTrigger="<tab>"

autocmd BufNewFile,BufRead *.dart,*.css,*.jsx,*.tsx let g:completion_enable_snippet = 'vim-vsnip' 
imap <expr> <CR> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<CR>'

        inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
        imap <silent> <c-space> <Plug>(completion_trigger)

        " Set completeopt to have a better completion experience
        set completeopt=menuone,noinsert,noselect

        " Avoid showing message extra message when using completion
        set shortmess+=c

        let g:completion_sorting = "length"
        let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>

nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e :Lspsaga lsp_jump_diagnostic_next<CR>
nnoremap <silent> ]e :Lspsaga lsp_jump_diagnostic_prev<CR>
