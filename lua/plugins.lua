local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function() use {'wbthomason/packer.nvim', opt = true}
-- Better Comments
use 'terrortylor/nvim-comment'
-- Repeat stuff 
use 'tpope/vim-repeat'
use 'RRethy/vim-illuminate'
use 'machakann/vim-highlightedyank'
-- Ident
use 'Yggdroot/indentLine'
-- Tree
use 'kyazdani42/nvim-tree.lua'
-- Surround
use 'tpope/vim-surround'
-- Treesitter 
use 'nvim-treesitter/nvim-treesitter'
-- Rainbow
use {'luochen1990/rainbow'}
-- ScreenShot
use {'jmckiern/vim-shoot',run='\"./install.py\" chromedriver' }
-- Auto pairs for '(' '[' '{'
use 'windwp/nvim-autopairs'
-- Themes
use 'sainnhe/gruvbox-material'
-- Status Line
use {
  'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  requires = {'kyazdani42/nvim-web-devicons'}
 }
-- Buffer Bar
use 'akinsho/nvim-bufferline.lua'
-- Git
use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  }
}
use 'tpope/vim-fugitive'
use 'junegunn/gv.vim'
use 'rhysd/git-messenger.vim'
-- See what keys do like in emacs
use 'liuchengxu/vim-which-key'
-- Find and replace
use 'brooth/far.vim'
-- async tasks
use 'skywind3000/asynctasks.vim'
use 'skywind3000/asyncrun.vim'
-- Easily Create Gists
use 'mattn/vim-gist'
-- Colorizer
use 'norcalli/nvim-colorizer.lua'
-- Intuitive buffer closing
use {'ojroques/nvim-bufdel'}
-- Debugging
use 'neovim/nvim-lspconfig'
use 'hrsh7th/nvim-compe'
use 'glepnir/lspsaga.nvim'
use 'onsails/lspkind-nvim'
use 'anott03/nvim-lspinstall'
-- Snippets
use 'SirVer/ultisnips'
use 'honza/vim-snippets'

use 'hrsh7th/vim-vsnip'
use 'hrsh7th/vim-vsnip-integ'

use 'Nash0x7E2/awesome-flutter-snippets'
use 'dsznajder/vscode-es7-javascript-react-snippets'
-- DB
use 'tpope/vim-dadbod'
use 'kristijanhusak/vim-dadbod-ui'
use 'kristijanhusak/vim-dadbod-completion'
-- Live Server
use {'turbio/bracey.vim', run = 'npm install --prefix server'}
-- Flutter 
use 'akinsho/flutter-tools.nvim'
use 'akinsho/dependency-assist.nvim'
-- Test
use 'vim-test/vim-test'
-- Format
use 'sbdchd/neoformat'
-- JAVA
use  'artur-shaik/vim-javacomplete2'
end)
