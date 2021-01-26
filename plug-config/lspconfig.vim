lua require'lspconfig'.dartls.setup{}
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.vimls.setup{}
lua require'lspconfig'.cssls.setup{}
lua require'lspconfig'.jsonls.setup {}
lua require'dependency_assist'.setup{}
lua require'flutter-tools'.setup{}

lua << EOF
        vim.fn.sign_define('LspDiagnosticsSignError', {text='', texthl='LspDiagnosticsSignError',linehl='', numhl=''})
        vim.fn.sign_define('LspDiagnosticsSignWarning', {text='', texthl='LspDiagnosticsSignWarning', linehl='', numhl=''})
        vim.fn.sign_define('LspDiagnosticsSignInformation', {text='', texthl='LspDiagnosticsSignInformation', linehl='', numhl=''})
        vim.fn.sign_define('LspDiagnosticsSignHint', {text='', texthl='LspDiagnosticsSignHint', linehl='', numhl=''})
EOF

lua <<EOF
        vim.lsp.callbacks['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
        vim.lsp.callbacks['textDocument/references'] = require'lsputil.locations'.references_handler
        vim.lsp.callbacks['textDocument/definition'] = require'lsputil.locations'.definition_handler
        vim.lsp.callbacks['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
        vim.lsp.callbacks['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler vim.lsp.callbacks['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
        vim.lsp.callbacks['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
        vim.lsp.callbacks['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
EOF

        let g:completion_enable_auto_popup = 1
        " Use <Tab> and <S-Tab> to navigate through popup menu
        inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
        imap <silent> <c-space> <Plug>(completion_trigger)
        imap <tab> <Plug>(completion_smart_tab)
        imap <s-tab> <Plug>(completion_smart_s_tab)

        " Set completeopt to have a better completion experience
        set completeopt=menuone,noinsert,noselect

        " Avoid showing message extra message when using completion
        set shortmess+=c
        let g:completion_enable_snippet = 'UltiSnips'
        imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
              \ "\<Plug>(completion_confirm_completion)"  : "\<c-y>\<CR>" :  "\<CR>"
        let g:completion_sorting = "length"
        let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
        let g:UltiSnipsSnippetDirectories=['~/.config/nvim/.vim/UltiSnips']
