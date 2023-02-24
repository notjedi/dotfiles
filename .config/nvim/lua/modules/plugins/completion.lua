local completion = {}

completion["neovim/nvim-lspconfig"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("completion.lsp"),
	dependencies = {
		{ "ray-x/lsp_signature.nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"glepnir/lspsaga.nvim",
			config = require("completion.lspsaga"),
		},
		{
			"jose-elias-alvarez/null-ls.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"jay-babu/mason-null-ls.nvim",
			},
			config = require("completion.null-ls"),
		},
	},
}
completion["hrsh7th/nvim-cmp"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("completion.cmp"),
	dependencies = {
		{ "onsails/lspkind.nvim" },
		{ "lukas-reineke/cmp-under-comparator" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "andersevenrud/cmp-tmux" },
		{ "hrsh7th/cmp-path" },
		{ "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-buffer" },
		{ "kdheepak/cmp-latex-symbols" },
		{ "ray-x/cmp-treesitter" },
		-- { "tzachar/cmp-tabnine", build = "./install.sh", config = require("completion.tabnine") },
		-- {
		-- 	"jcdickinson/codeium.nvim",
		-- 	dependencies = {
		-- 		"nvim-lua/plenary.nvim",
		-- 		"MunifTanjim/nui.nvim",
		-- 	},
		-- 	config = require("completion.codeium"),
		-- },
	},
}

return completion
