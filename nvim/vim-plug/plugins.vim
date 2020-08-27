" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " OneDark Theme
    Plug 'joshdick/onedark.vim'
    " Coc for intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Ranger Plugin
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " SpaceCamp Theme
    Plug 'jaredgorski/spacecamp'
    " Lucid Theme
    Plug 'cseelus/vim-colors-lucid'
    " Dicord Presence from nvim
    Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}

    call plug#end()
