" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Comments
    Plug 'tpope/vim-commentary'
    " Repeat stuff
    Plug 'tpope/vim-repeat'
    " highlight all matches under cursor
    Plug 'RRethy/vim-illuminate'
    Plug 'easymotion/vim-easymotion'
    Plug 'machakann/vim-highlightedyank'
    " Ident
    " Plug 'glepnir/indent-guides.nvim'
    " Easymotion
    Plug 'easymotion/vim-easymotion'
    " Tree
    Plug 'kyazdani42/nvim-tree.lua'
    " Surround
    Plug 'tpope/vim-surround'
    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter'
    " Cool Icons
    Plug 'kyazdani42/nvim-web-devicons'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Closetags
    Plug 'alvan/vim-closetag'
    " Themes
    Plug 'morhetz/gruvbox'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Status Line
    Plug 'glepnir/galaxyline.nvim'
    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'rhysd/git-messenger.vim'
   " Start Screen
    Plug 'glepnir/dashboard-nvim'
   " See what keys do like in emacs
    Plug 'liuchengxu/vim-which-key'
    " Snippets
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'
    " Better tabline
    Plug 'romgrk/barbar.nvim'
    " Find and replace
    Plug 'brooth/far.vim'
    " Auto change html tags
    Plug 'AndrewRadev/tagalong.vim'
    " async tasks
    Plug 'skywind3000/asynctasks.vim'
    Plug 'skywind3000/asyncrun.vim'
    " Swap windows
    Plug 'wesQ3/vim-windowswap'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Clap
    Plug 'liuchengxu/vim-clap'
    " Easily Create Gists
    Plug 'mattn/vim-gist'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'frazrepo/vim-rainbow'
    " Intuitive buffer closing
    Plug 'moll/vim-bbye'
    " Debugging
    Plug 'neovim/nvim-lspconfig'
    " Live Server
    Plug  'turbio/bracey.vim', {'do': 'npm install --prefix server'}
    " Rnvimr
    Plug 'kevinhwang91/rnvimr'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
