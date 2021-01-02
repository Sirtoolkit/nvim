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
    " Easymotion
    Plug 'easymotion/vim-easymotion'
    " Tree
    Plug 'scrooloose/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    " Surround
    Plug 'tpope/vim-surround'
    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter'
    " Cool Icons
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Closetags
    Plug 'alvan/vim-closetag'
    " Themes
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Status Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'rhysd/git-messenger.vim'
   " Start Screen
    Plug 'glepnir/dashboard-nvim'
    Plug 'liuchengxu/vim-clap'
    " Plug 'nvim-lua/popup.nvim'
    " Plug 'nvim-lua/plenary.nvim'
    " Plug 'nvim-telescope/telescope.nvim'
    " See what keys do like in emacs
    Plug 'liuchengxu/vim-which-key'
    " Snippets
    Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'
    " Better tabline
    Plug 'romgrk/barbar.nvim'
    " Find and replace
    Plug 'brooth/far.vim'
    " Auto change html tags
    Plug 'AndrewRadev/tagalong.vim'
    " Smooth scroll
    Plug 'psliwka/vim-smoothie'
    " async tasks
    Plug 'skywind3000/asynctasks.vim'
    Plug 'skywind3000/asyncrun.vim'
    " Swap windows
    Plug 'wesQ3/vim-windowswap'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Easily Create Gists
    Plug 'mattn/vim-gist'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'frazrepo/vim-rainbow'
    " Intuitive buffer closing
    Plug 'moll/vim-bbye'
    " Debugging
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'szw/vim-maximizer'
    " Live Server
    Plug  'turbio/bracey.vim', {'do': 'npm install --prefix server'}
    " Minimap
    Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
