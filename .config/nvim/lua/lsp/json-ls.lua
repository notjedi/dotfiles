require'lspconfig'.jsonls.setup {
    cmd = { "vscode-json-languageserver", "--stdio" },
    filetypes = { "json" },
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
        }
    }
}
