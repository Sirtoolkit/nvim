" Disable tabline close button
 " Lightlane
 let g:lightline = {
       \ 'active': {
       \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
       \   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
       \ 
 },
       \ 'inactive': {
       \   'left': [['inactive'], ['relativepath']],
       \   'right': [['bufnum']]
       \ 
 },
       \ 'component': {
       \   'bufnum': '%n',
       \   'inactive': 'inactive'
       \ 
 },
       \ 'component_function': {
       \   'gitbranch': 'fugitive#head',
       \   'kitestatus': 'kite#statusline'
       \ 
 },
       \ 'colorscheme': 'gruvbox',
       \ 'subseparator': {
       \   'left': '',
       \   'right': ''
       \ 
 }
       \}
