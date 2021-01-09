"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" General Settings
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim

  " VS Code extension
  source $HOME/.config/nvim/plug-config/easymotion.vim
  source $HOME/.config/nvim/plug-config/highlightyank.vim

  " Themes
  source $HOME/.config/nvim/themes/themes.vim
  source $HOME/.config/nvim/themes/galaxyline.vim

  " Plugin Configuration
  source $HOME/.config/nvim/keys/which-key.vim
  source $HOME/.config/nvim/plug-config/vim-commentary.vim
  luafile $HOME/.config/nvim/lua/treesitter.lua
  luafile $HOME/.config/nvim/lua/plug-colorizer.lua
  luafile $HOME/.config/nvim/lua/dev-icons.lua
  source $HOME/.config/nvim/plug-config/coc/coc.vim
  source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim
  source $HOME/.config/nvim/plug-config/easymotion.vim
  source $HOME/.config/nvim/plug-config/gitgutter.vim
  source $HOME/.config/nvim/plug-config/git-messenger.vim
  source $HOME/.config/nvim/plug-config/closetags.vim
  source $HOME/.config/nvim/plug-config/barbar.vim
  source $HOME/.config/nvim/plug-config/far.vim
  source $HOME/.config/nvim/plug-config/tagalong.vim
  source $HOME/.config/nvim/plug-config/asynctask.vim
  source $HOME/.config/nvim/plug-config/window-swap.vim
  source $HOME/.config/nvim/plug-config/vim-lsp.vim
  source $HOME/.config/nvim/plug-config/nvimtree.vim
  source $HOME/.config/nvim/plug-config/bracey.vim
  source $HOME/.config/nvim/plug-config/rainbow.vim
  source $HOME/.config/nvim/plug-config/dashboard.vim
  source $HOME/.config/nvim/plug-config/rnvimr.vim
" Better nav for omnicomplete TODO figure out why this is being overridden
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
