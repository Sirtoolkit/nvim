" Leader Key Maps

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
nnoremap <leader>? CocSearch <C-R>=expand("<cword>")<CR><CR>
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
let g:which_key_map['/'] = [ ':call Comment()'                                 , 'comment' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                                     , 'open init' ]
let g:which_key_map['h'] = [ '<C-W>s'                                          , 'split below']
let g:which_key_map['v'] = [ '<C-W>v'                                          , 'split right']
let g:which_key_map['d'] = [ ':Bdelete'                                        , 'delete-buffer']
let g:which_key_map['r'] = [ ':RnvimrToggle'                                   , 'ranger']

" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'l' : [':Bracey'                 , 'start live server'],
      \ 'L' : [':BraceyStop'             , 'stop live server'],
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
      \ 'r' : [':CocCommand flutter.run'             , 'Flutter run'],
      \ 'C' : [':CocCommand flutter.create'          , 'Flutter Create'],
      \ 'd' : [':CocCommand flutter.doctor'          , 'Flutter Doctor'],
      \ 'p' : [':CocCommand flutter.pub.get'         , 'Flutter Pub Get'],
      \ 'D' : [':CocCommand flutter.devices'         , 'Flutter Devices'],
      \ 'e' : [':CocCommand flutter.emulators'       , 'Flutter Emulators'],
      \ 'O' : [':CocCommand flutter.outline'         , 'Flutter Outline'],
      \ 'q' : [':CocCommand flutter.dev.quit'        , 'Flutter Quit'],
      \ 'H' : [':CocCommand flutter.dev.hotReload'   , 'Flutter Hot Reload'],
      \ 'h' : [':CocCommand flutter.dev.hotRestart'  , 'Flutter Hot Restart'],
      \ 's' : [':CocCommand flutter.dev.screenshot'  , 'Flutter Screenshot'],
      \ 'o' : [':CocCommand flutter.dev.openDevLog'  , 'Flutter open Dev Log'],
      \ 'c' : [':CocCommand flutter.dev.clearDevLog' , 'Flutter Clear Dev Log'],
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
      \ 'b' : [':CocCommand fzf-preview.BufferLines'    , 'current buffer'],
      \ 'B' : [':CocCommand fzf-preview.Buffers'        , 'open buffers'],
      \ 'd' : [':CocCommand fzf-preview.DirectoryFiles' , 'directories'],
      \ 'f' : [':CocCommand fzf-preview.ProjectFiles'   , 'files'],
      \ 'g' : [':CocCommand fzf-preview.GitFiles'       , 'git files'],
      \ 'm' : [':CocCommand fzf-preview.Marks'          , 'list marks'],
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
      \ 'L' : [':CocCommand fzf-preview.GitLogs'     , 'log fzf'],
      \ 'p' : [':Git push'                           , 'push'],
      \ 'P' : [':Git pull'                           , 'pull'],
      \ 'm' : [':GitMessenger'                       , 'message'],
      \ 'r' : [':GRemove'                            , 'remove'],
      \ 'S' : [':CocCommand fzf-preview.GitStatus'   , 'status'],
      \ 'n' : [':CocCommand fzf-preview.GitBranches' , 'branches'],
      \ 'e' : [':CocCommand fzf-preview.GitReflogs'  , 'reflog'],
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
