"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

  " General Settings
  source $HOME/.config/nvim/general/settings.vim

  " Mappings and Keys 
  source $HOME/.config/nvim/keys/mappings.vim
  source $HOME/.config/nvim/keys/which-key.vim

  " Themes
  source $HOME/.config/nvim/themes/themes.vim

  " Plugin Configuration - Vimscript
  source $HOME/.config/nvim/plug-config/asynctask.vim
  source $HOME/.config/nvim/plug-config/nvim-comment.vim
  source $HOME/.config/nvim/plug-config/far.vim
  source $HOME/.config/nvim/plug-config/highlightyank.vim
  source $HOME/.config/nvim/plug-config/bracey.vim
  source $HOME/.config/nvim/plug-config/dbui.vim
  source $HOME/.config/nvim/plug-config/indent.vim
  source $HOME/.config/nvim/plug-config/neoformat.vim
  source $HOME/.config/nvim/plug-config/rainbow.vim
  source $HOME/.config/nvim/plug-config/nvim-shoot.vim

  " Plugin Configuration - lua 
  luafile $HOME/.config/nvim/lua/dev-icons.lua
  luafile $HOME/.config/nvim/lua/nvim-compe.lua
  luafile $HOME/.config/nvim/lua/lspkind-nvim.lua
  luafile $HOME/.config/nvim/lua/colorizer-nvim.lua
  luafile $HOME/.config/nvim/lua/galaxyline-nvim.lua
  luafile $HOME/.config/nvim/lua/bufferline-nvim.lua
  luafile $HOME/.config/nvim/lua/gitsigns-nvim.lua
  luafile $HOME/.config/nvim/lua/autopairs-nvim.lua
  luafile $HOME/.config/nvim/lua/treesitter-nvim.lua
  luafile $HOME/.config/nvim/lua/tree-nvim.lua
  luafile $HOME/.config/nvim/lua/flutter-tools-nvim.lua
  luafile $HOME/.config/nvim/lua/dapui-nvim.lua
  luafile $HOME/.config/nvim/lua/lspconfig-nvim.lua
  luafile $HOME/.config/nvim/lua/toggleterm-nvim.lua
  luafile $HOME/.config/nvim/lua/colors-nvim.lua
  luafile $HOME/.config/nvim/lua/trouble-nvim.lua
