" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			        " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitright                          " Vertical splits will automatically be to the right
set splitbelow                          " Horizontal splits will automatically be below
set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=jql                  " Stop newline continution of comments
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
syntax on
colorscheme dracula
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set ignorecase                          " ignorecase case while searching
set noshowmode                          " prevent --INSERT-- from showing" 
set termguicolors                       " enable 256 bit color support"
set cursorline                          " highlight current line
set autochdir                           " Your working directory will always be the same as your working directory
set laststatus=2                        " galaxyline doesn't show up if it's not set to 2
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

autocmd FileType json setlocal commentstring=//\ %s
" autocmd FileType c,cpp,cc
"     \ autocmd BufWritePre normal gg=G
" autocmd BufWritePre *.cpp normal gg=G
" autocmd BufWritePre *.cc normal gg=G
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" You can't stop me
cmap w!! w !doas tee %
