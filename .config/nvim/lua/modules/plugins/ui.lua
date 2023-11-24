local ui = {}

-- ui["goolord/alpha-nvim"] = {
-- 	lazy = true,
-- 	event = "BufWinEnter",
-- 	config = require("ui.alpha"),
-- }
ui["akinsho/bufferline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline"),
}
ui["catppuccin/nvim"] = {
	lazy = true,
	name = "catppuccin",
	cmd = { "LoadAllThemes" },
	config = require("ui.catppuccin"),
}
ui["rose-pine/neovim"] = {
	lazy = false,
	name = "rosepine",
	config = require("ui.rosepine"),
}
ui["rebelot/kanagawa.nvim"] = {
	lazy = true,
	name = "kanagawa",
	cmd = { "LoadAllThemes" },
	config = require("ui.kanagawa"),
}
ui["tiagovla/tokyodark.nvim"] = {
	lazy = true,
	name = "tokyodark",
	cmd = { "LoadAllThemes" },
}
ui["folke/tokyonight.nvim"] = {
	lazy = true,
	name = "tokyonight",
	cmd = { "LoadAllThemes" },
	config = require("ui.tokyonight"),
}
ui["sam4llis/nvim-tundra"] = {
	lazy = true,
	name = "tundra",
	cmd = { "LoadAllThemes", "Tundra" },
	config = require("ui.tundra"),
}
ui["j-hui/fidget.nvim"] = {
	lazy = true,
	tag = "legacy",
	event = "BufReadPost",
	config = require("ui.fidget"),
}
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.indent-blankline"),
}
ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}
-- ui["zbirenbaum/neodim"] = {
-- 	lazy = true,
-- 	event = "LspAttach",
-- 	config = require("ui.neodim"),
-- }
ui["karb94/neoscroll.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.neoscroll"),
}
-- ui["dstein64/nvim-scrollview"] = {
-- 	lazy = true,
-- 	event = "BufReadPost",
-- 	config = require("ui.scrollview"),
-- }

return ui
