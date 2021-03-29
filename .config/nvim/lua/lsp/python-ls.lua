require'lspconfig'.pyright.setup {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" }
    -- handlers = {
    --     ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    --         virtual_text = O.python.diagnostics.virtual_text,
    --         signs = O.python.diagnostics.signs,
    --         underline = O.python.diagnostics.underline,
    --         update_in_insert = true

    --     })
    -- }
}
