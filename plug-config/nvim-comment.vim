lua << EOF
require('nvim_comment').setup({
  marker_padding = true,
  comment_empty = true,
  create_mappings = false,
})
EOF

function! Comment()
  if (mode() == "n" )
    execute "CommentToggle"
  else    
    execute "'<,'>CommentToggle"
  endif
 endfunction
