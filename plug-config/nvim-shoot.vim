function! Shoot()
  if (mode() == "n" )
    execute "TOpng"
  else    
    execute "'<,'>TOpng"
  endif
 endfunction
