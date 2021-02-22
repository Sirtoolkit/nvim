nnoremap <C-d> :DBUIToggle<CR>

let g:db_ui_winwidth = 30
let g:db_ui_show_help = 0
" Source is automatically added, you just need to include it in the chain complete list
let g:completion_chain_complete_list = {
    \   'sql': [
    \    {'complete_items': ['vim-dadbod-completion']},
    \   ],
    \ }
" Make sure `substring` is part of this list. Other items are optional for this completion source
let g:completion_matching_strategy_list = ['exact', 'substring']
" Useful if there's a lot of camel case items
let g:completion_matching_ignore_case = 1
" let g:db_ui_save_location = '~/Dropbox/db_ui_queries'
