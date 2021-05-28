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
    Plug 'hrsh7th/nvim-compe'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'sheerun/vim-polyglot'
    Plug 'neovim/nvim-lspconfig'
    Plug 'terrortylor/nvim-comment'
    
    " Themes
    Plug 'dracula/vim'
    Plug 'dylanaraps/wal.vim'
    Plug 'hzchirs/vim-material'
    Plug 'joshdick/onedark.vim'
    Plug 'jaredgorski/spacecamp'
    Plug 'cseelus/vim-colors-lucid'
    Plug 'rafi/awesome-vim-colorschemes'
    " Plug 'vim-airline/vim-airline-themes'
    Plug 'Rigellute/shades-of-purple.vim'
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    
    " Aesthetics 
    Plug 'romgrk/barbar.nvim'
    Plug 'mhinz/vim-startify'
    Plug 'windwp/nvim-autopairs'
    Plug 'ryanoasis/vim-devicons'
    " Plug 'vim-airline/vim-airline'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    
    " Navigation
    Plug 'junegunn/fzf.vim'
    Plug 'justinmk/vim-sneak'
    Plug 'unblevable/quick-scope'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    
    " Git
    Plug 'junegunn/gv.vim'
    Plug 'tpope/vim-rhubarb'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-rooter'

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

    " Misc
    Plug 'junegunn/goyo.vim'
    Plug 'andweeb/presence.nvim'
    Plug 'voldikss/vim-floaterm'
    Plug 'rhysd/vim-startuptime'
    Plug 'liuchengxu/vim-which-key'
    Plug 'norcalli/nvim-colorizer.lua'
    

call plug#end()
