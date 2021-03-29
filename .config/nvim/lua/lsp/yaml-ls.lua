require'lspconfig'.yamlls.setup{
	cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml" }
}
