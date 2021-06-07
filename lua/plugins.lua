local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]] return require('packer').startup(function() use {'wbthomason/packer.nvim', opt = true}
-- Better Comments
use 'terrortylor/nvim-comment'
-- Illuminate
use 'RRethy/vim-illuminate'
-- HighlightedYank
use 'machakann/vim-highlightedyank'
-- IdentLine
use 'Yggdroot/indentLine'
-- Tree
use 'kyazdani42/nvim-tree.lua'
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
-- Colors
use 'norcalli/nvim-colorizer.lua'
-- Intuitive buffer closing
use {'ojroques/nvim-bufdel'}
-- Debugging
use 'neovim/nvim-lspconfig'
use 'kabouzeid/nvim-lspinstall'
use 'hrsh7th/nvim-compe'
use 'glepnir/lspsaga.nvim'
-- Snippets
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/vim-vsnip-integ'

use 'Nash0x7E2/awesome-flutter-snippets'
use 'honza/vim-snippets'
use 'dsznajder/vscode-es7-javascript-react-snippets'
use 'rafamadriz/friendly-snippets'
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
-- Dispatch
use 'tpope/vim-dispatch'
-- Debbuger
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap","Pocco81/DAPInstall.nvim"} }
-- Term
use {"akinsho/nvim-toggleterm.lua"}
end)
