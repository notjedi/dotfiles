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
    " Shades of Purple Theme
    Plug 'Rigellute/shades-of-purple.vim'
    " Material Theme 
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Rainbow Parentheses
    Plug 'junegunn/rainbow_parentheses.vim'
    " Startify
    Plug 'mhinz/vim-startify'
    " Cool Icons
    Plug 'ryanoasis/vim-devicons'
    " Git
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    " Sneak
    Plug 'justinmk/vim-sneak'
    "vim-which-key
    Plug 'liuchengxu/vim-which-key'
    Plug 'honza/vim-snippets'
    Plug 'metakirby5/codi.vim'
    
    Plug 'godlygeek/tabular'
    " Plug 'plasticboy/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

    call plug#end()
