local tool = {}

tool["tpope/vim-fugitive"] = {
	lazy = true,
	cmd = { "Git", "G" },
}
-- Please don't remove which-key.nvim otherwise you need to set timeoutlen=300 at `lua/core/options.lua`
tool["folke/which-key.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("tool.which-key"),
}
tool["nvim-tree/nvim-tree.lua"] = {
	lazy = true,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeRefresh",
	},
	config = require("tool.nvim-tree"),
}
tool["ibhagwan/smartyank.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("tool.smartyank"),
}
tool["akinsho/toggleterm.nvim"] = {
	lazy = true,
	cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	},
	config = require("tool.toggleterm"),
}
tool["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = require("tool.trouble"),
}
tool["gelguy/wilder.nvim"] = {
	lazy = true,
	event = "CmdlineEnter",
	config = require("tool.wilder"),
	dependencies = { "romgrk/fzy-lua-native" },
}
tool["folke/todo-comments.nvim"] = {
	lazy = true,
	cmd = {
		"TodoTrouble",
		"TodoLocList",
		"TodoQuickFix",
		"TodoTelescope",
	},
	dependencies = { "nvim-lua/plenary.nvim" },
}
tool["lewis6991/hover.nvim"] = {
	lazy = false,
	config = function()
		require("hover").setup({
			init = function()
				require("hover.providers.gh")
				require("hover.providers.lsp")
				require("hover.providers.man")
				require("hover.providers.gh_user")
				require("hover.providers.dictionary")
			end,
			preview_opts = {
				border = nil,
			},
			preview_window = false,
			title = true,
		})

		local bind = require("keymap.bind")

		bind.nvim_load_mapping({
			["n|K"] = bind.map_callback(function()
				require("hover").hover()
			end):with_desc("hover.nvim"),
			["n|gK"] = bind.map_callback(function()
				require("hover").hover_select()
			end):with_desc("hover.nvim select"),
		})
	end,
}

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
tool["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	cmd = "Telescope",
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "debugloop/telescope-undo.nvim" },
		{
			"ahmedkhalf/project.nvim",
			event = "BufReadPost",
			config = require("tool.project"),
		},
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-frecency.nvim", dependencies = {
			{ "kkharji/sqlite.lua" },
		} },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
	},
}

return tool
