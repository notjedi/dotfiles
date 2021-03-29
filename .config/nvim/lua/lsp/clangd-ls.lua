require'lspconfig'.clangd.setup {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cc", "cpp", "objc", "objcpp" }
}
