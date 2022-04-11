vim.cmd([[
  augroup _general
    autocmd!
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd BufReadPost * silent! normal! g`"
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _highlight
    autocmd!
    autocmd ColorScheme * let w:m1=matchadd('ErrorMsg', '\%>100v.\+', -1)
    autocmd ColorScheme * let w:m2=matchadd('ExtraWhitespace', '\s\+$', -1)
    autocmd ColorScheme * highlight ExtraWhitespace guibg=NONE guifg=red gui=underline
  augroup end

  augroup _delete_trailing_space
    au BufWritePre * %s/\s\+$//e
    au BufWritePre * %s/\n\+\%$//e
  augroup end

  augroup _vim_wiki_start
    autocmd BufRead,BufNewFile /mnt/Seagate/Code/vimwiki/** :VimwikiStart
  augroup end

]])
