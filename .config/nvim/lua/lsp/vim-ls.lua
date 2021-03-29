require'lspconfig'.vimls.setup {
    cmd = { "vim-language-server", "--stdio" },
    filetypes = { "vim" },
}
