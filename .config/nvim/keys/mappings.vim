" g Leader key
let mapleader=" "

" Better nav for omnicomplete
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Use alt to navigate in insert mode
inoremap <M-j>    <C-o>j
inoremap <M-k>    <C-o>k
inoremap <M-h>    <C-o>h
inoremap <M-l>    <C-o>l
inoremap <M-b>    <C-o>b
inoremap <M-w>    <C-O>w

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Remove highlight after search
nnoremap // :noh<CR>

" Easy CAPS
" inoremap <C-u> <ESC>viwUi
nnoremap <C-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" Close tab
nnoremap <C-x> :bd<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :q!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Prevent ESC from moving one char to left
inoremap <silent> <Esc> <C-O>:stopinsert<CR>
" inoremap <silent> <Esc> <Esc>`^ " This works too

" See history
nmap <Leader>h :History:<CR>

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" Run code
nnoremap <F5> :!python3 %<CR>
