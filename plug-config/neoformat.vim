augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:neoformat_try_formatprg = 1

augroup NeoformatAutoFormat
      autocmd!
      autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\
                                                              \--stdin\
                                                              \--print-width\ 80\
                                                              \--single-quote\
                                                              \--trailing-comma\ es5
autocmd BufWritePre *.js Neoformat
augroup END