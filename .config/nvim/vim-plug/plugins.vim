" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " Auto install plugins while entering vim
  " autocmd VimEnter * PlugInstall
  " autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Syntax, intellisense and snippets
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-commentary'
    Plug 'sheerun/vim-polyglot'
    " Plug 'preservim/nerdcommenter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " Themes
    Plug 'dracula/vim'
    Plug 'joshdick/onedark.vim'
    Plug 'jaredgorski/spacecamp'
    Plug 'cseelus/vim-colors-lucid'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Rigellute/shades-of-purple.vim'
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    
    " Aesthetics 
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'junegunn/rainbow_parentheses.vim'
    
    " Navigation
    Plug 'junegunn/fzf.vim'
    Plug 'justinmk/vim-sneak'
    Plug 'airblade/vim-rooter'
    Plug 'unblevable/quick-scope'
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Plug 'scrooloose/NERDTree'
    
    " Git
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " Plug 'plasticboy/vim-markdown'

    " Misc
    Plug 'metakirby5/codi.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'voldikss/vim-floaterm'
    Plug 'liuchengxu/vim-which-key'
    Plug 'norcalli/nvim-colorizer.lua'
    

call plug#end()
