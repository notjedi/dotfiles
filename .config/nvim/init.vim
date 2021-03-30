""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
" ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
" ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║ 
" ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"
""""""""""""""""""""""""""""""""""""""""""""""""""""
                                                
" General Settings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim

" Themes
" source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/themes/onedark.vim

" Plugin Configuration
source $HOME/.config/nvim/plug-config/lsp-config.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/plug-config/startify.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/sneak.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
source $HOME/.config/nvim/plug-config/nvim-tree.vim
" source $HOME/.config/nvim/keys/which-key.vim
luafile $HOME/.config/nvim/lua/plugins/plug-colorizer.lua
luafile $HOME/.config/nvim/lua/plugins/compe-config.lua
luafile $HOME/.config/nvim/lua/plugins/nvim-comment.lua
luafile $HOME/.config/nvim/lua/plugins/nvim-autopairs.lua
luafile $HOME/.config/nvim/lua/plugins/barbar.lua
luafile $HOME/.config/nvim/lua/plugins/galaxyline.lua
luafile $HOME/.config/nvim/lua/plugins/lspsaga.lua
luafile $HOME/.config/nvim/lua/plugins/nvim-lightbulb.lua

" lsp
luafile $HOME/.config/nvim/lua/lsp/python-ls.lua
luafile $HOME/.config/nvim/lua/lsp/clangd-ls.lua
luafile $HOME/.config/nvim/lua/lsp/vim-ls.lua
luafile $HOME/.config/nvim/lua/lsp/json-ls.lua
luafile $HOME/.config/nvim/lua/lsp/yaml-ls.lua
luafile $HOME/.config/nvim/lua/lsp/go-ls.lua
luafile $HOME/.config/nvim/lua/lsp/bash-ls.lua
luafile $HOME/.config/nvim/lua/lsp/lua-ls.lua
luafile $HOME/.config/nvim/lua/lsp/virtual-text.lua
