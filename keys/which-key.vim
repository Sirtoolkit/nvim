let @s = 'veS"'

" Timeout let g:which_key_timeout = 100

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Coc Search & refactor
let g:which_key_map['?'] = 'search word'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" Change the colors if you want

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" Single mappings
let g:which_key_map['c'] = [ ':call Comment()'                                 , 'comment' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                                     , 'open init' ]
let g:which_key_map['h'] = [ '<C-W>s'                                          , 'split below']
let g:which_key_map['v'] = [ '<C-W>v'                                          , 'split right']
let g:which_key_map['d'] = [ ':Bdelete'                                        , 'delete-buffer']
let g:which_key_map['r'] = [ ':RnvimrToggle'                                   , 'ranger']
" let g:which_key_map['u'] = [ ':lua vim.lsp.buf.code_action()'                  , 'code action']
" let g:which_key_map['i'] = [ ':lua vim.lsp.buf.hover()'                        , 'hover']
" let g:which_key_map['o'] = [ ':lua vim.lsp.buf.definition()'                   , 'definition']
" let g:which_key_map['p'] = [ ':lua vim.lsp.buf.formatting()'                   , 'formatting']
nmap <leader>u :lua vim.lsp.buf.code_action()<CR>
nmap <leader>i :lua vim.lsp.buf.hover()<CR>
nmap <leader>o :lua vim.lsp.buf.definition()<CR>
nmap <leader>p :lua vim.lsp.buf.formatting()<CR>

" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'b' : [':Bracey'                 , 'start live server'],
      \ 's' : [':BraceyStop'             , 'stop live server'],
      \ 'm' : [':MarkdownPreview'        , 'markdown preview'],
      \ 'M' : [':MarkdownPreviewStop'    , 'markdown preview stop'],
      \ }

" F is for find and replace
let g:which_key_map.F = {
      \ 'name' : '+find & replace' ,
      \ 'f' : [':Farr --source=vimgrep'    , 'file'],
      \ 'p' : [':Farr --source=rgnvim'     , 'project'],
      \ }

" f is for Flutter Commands 
let g:which_key_map.f = {
      \ 'name' : 'Flutter' ,
      \ 'r' : [':FlutterRun'                         , 'flutter run'],
      \ 'D' : [':FlutterDevices'                     , 'flutter devices'],
      \ 'e' : [':FlutterEmulators'                   , 'flutter emulators'],
      \ 'a' : [':AddDependency'                      , 'flutter dependency'],
      \ 'p' : [':FlutterPubGet'                      , 'flutter pub get'],
      \ 'q' : [':FlutterQuit'                        , 'flutter quit'],
      \ 'H' : [':FlutterReload'                      , 'flutter hot reload'],
      \ 'h' : [':FlutterRestart'                     , 'flutter hot restart'],
      \ 'o' : [':FlutterDevLog'                      , 'flutter visual debug'],
      \ 'O' : [':FlutterOutline'                     , 'flutter Outline'],
      \ }


" k is for task
let g:which_key_map.k = {
      \ 'name' : '+task' ,
      \ 'c' : [':AsyncTask file-compile'      , 'compile file'],
      \ 'b' : [':AsyncTask project-build'     , 'build project'],
      \ 'g' : [':AsyncTaskEdit!'              , 'edit global tasks'],
      \ 'r' : [':AsyncTask file-run'          , 'run file'],
      \ 'p' : [':AsyncTask project-run'       , 'run project'],
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ 'b' : [':FzfPreviewBufferLinesRpc'              , 'current buffer'],
      \ 'B' : [':FzfPreviewBuffersRpc'                  , 'open buffers'],
      \ 'd' : [':FzfPreviewDirectoryFilesRpc'           , 'directories'],
      \ 'f' : [':FzfPreviewProjectFilesRpc'             , 'files'],
      \ 'g' : [':FzfPreviewGitFilesRpc'                 , 'git files'],
      \ 'm' : [':FzfPreviewMarksRpc'                    , 'list marks'],
      \ }
 
" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                          , 'add all'],
      \ 'b' : [':Git blame'                          , 'blame'],
      \ 'B' : [':GBrowse'                            , 'browse'],
      \ 'c' : [':Git commit'                         , 'commit'],
      \ 'd' : [':Git diff'                           , 'diff'],
      \ 'D' : [':Gdiffsplit'                         , 'diff split'],
      \ 'g' : [':Gstatus'                            , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'      , 'highlight hunks'],
      \ 'i' : [':Gist -b'                            , 'post gist'],
      \ 'l' : [':Git log'                            , 'log'],
      \ 'L' : [':FzfPreviewGitLogsRpc'               , 'log fzf'],
      \ 'p' : [':Git push'                           , 'push'],
      \ 'P' : [':Git pull'                           , 'pull'],
      \ 'm' : [':GitMessenger'                       , 'message'],
      \ 'r' : [':GRemove'                            , 'remove'],
      \ 'S' : [':FzfPreviewGitStatusRpc'             , 'status'],
      \ 'n' : [':FzfPreviewGitBranchesRpc'           , 'branches'],
      \ 'e' : [':FzfPreviewGitReflogsRpc'            , 'reflog'],
      \ 'v' : [':GV'                                 , 'view commits'],
      \ 'V' : [':GV!'                                , 'view buffer commits'],
      \ }

let g:which_key_map.G = {
      \ 'name' : '+gist' ,
      \ 'a' : [':Gist -a'                          , 'post gist anon'],
      \ 'b' : [':Gist -b'                          , 'post gist browser'],
      \ 'd' : [':Gist -d'                          , 'delete gist'],
      \ 'e' : [':Gist -e'                          , 'edit gist'],
      \ 'l' : [':Gist -l'                          , 'list public gists'],
      \ 's' : [':Gist -ls'                         , 'list starred gists'],
      \ 'm' : [':Gist -m'                          , 'post gist all buffers'],
      \ 'p' : [':Gist -P'                          , 'post public gist '],
      \ 'P' : [':Gist -p'                          , 'post private gist '],
      \ }

call which_key#register('<Space>', "g:which_key_map")
