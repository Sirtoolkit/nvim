local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
-- Better Comments
use 'tpope/vim-commentary'
-- Repeat stuff
use 'tpope/vim-repeat'
-- highlight all matches under cursor
use 'RRethy/vim-illuminate'
use 'easymotion/vim-easymotion'
use 'machakann/vim-highlightedyank'
-- Ident
use 'glepnir/indent-guides.nvim'
-- Easymotion
use 'easymotion/vim-easymotion'
-- Tree
use 'kyazdani42/nvim-tree.lua'
-- Surround
use 'tpope/vim-surround'
-- Treesitter
use 'nvim-treesitter/nvim-treesitter'
-- Cool Icons
use 'kyazdani42/nvim-web-devicons'
-- Auto pairs for '(' '[' '{'
use 'jiangmiao/auto-pairs'
-- Closetags
use 'alvan/vim-closetag'
-- Themes
use 'morhetz/gruvbox'
-- Status Line
use 'glepnir/galaxyline.nvim'
-- Git
use 'airblade/vim-gitgutter'
use 'tpope/vim-fugitive'
use 'tpope/vim-rhubarb'
use 'junegunn/gv.vim'
use 'rhysd/git-messenger.vim'
-- Start Screen
use 'glepnir/dashboard-nvim'
-- See what keys do like in emacs
use 'liuchengxu/vim-which-key'
-- Better tabline
use 'romgrk/barbar.nvim'
-- Find and replace
use 'brooth/far.vim'
-- Auto change html tags
use 'AndrewRadev/tagalong.vim'
-- async tasks
use 'skywind3000/asynctasks.vim'
use 'skywind3000/asyncrun.vim'
-- Swap windows
use 'wesQ3/vim-windowswap'
-- FZF 
 use {'junegunn/fzf',run='-> fzf#install()'} 
 use {'yuki-yano/fzf-preview.vim',branch='release/rpc'}
-- Clap
use 'liuchengxu/vim-clap'
-- Easily Create Gists
use 'mattn/vim-gist'
-- Colorizer
use 'norcalli/nvim-colorizer.lua'
use 'frazrepo/vim-rainbow'
-- Intuitive buffer closing
use 'moll/vim-bbye'
-- Debugging
use 'neovim/nvim-lspconfig'
use 'nvim-lua/completion-nvim'
use 'RishabhRD/popfix'
use 'RishabhRD/nvim-lsputils'
-- Snippets
use 'sirver/ultisnips'
use 'honza/vim-snippets'
use 'Shougo/deoplete.nvim'
-- DB
use 'tpope/vim-dadbod'
use 'kristijanhusak/vim-dadbod-ui'
use 'kristijanhusak/vim-dadbod-completion'
-- Format
use 'sbdchd/neoformat'
-- Live Server
use {'turbio/bracey.vim', run = 'npm install --prefix server'}
-- Rnvimr
use 'kevinhwang91/rnvimr'
-- Flutter 
use 'akinsho/flutter-tools.nvim'
use 'akinsho/dependency-assist.nvim'
-- Search
use 'romainl/vim-cool'
-- Text objects
use 'wellle/targets.vim'
-- Wrapping/delimiters
use {'machakann/vim-sandwich', {'andymass/vim-matchup', event = 'VimEnter *'}}
-- Test
use 'vim-test/vim-test'
end)
