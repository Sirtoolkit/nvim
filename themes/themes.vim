hi Comment cterm=italic
syntax on
colorscheme  gruvbox
let g:nvcode_termcolors=256
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
     set termguicolors
     hi LineNr ctermbg=NONE guibg=NONE
endif
