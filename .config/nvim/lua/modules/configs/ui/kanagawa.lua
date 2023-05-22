return function()
	require("kanagawa").setup({
		compile = true,
		undercurl = true,
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = false,
		dimInactive = false,
		terminalColors = true,
		colors = {
			palette = {},
			theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		},
		theme = "wave",
		background = {
			dark = "wave", -- try "dragon" !
			light = "lotus",
		},
	})
end
