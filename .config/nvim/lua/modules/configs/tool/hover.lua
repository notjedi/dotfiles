return function()
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
end
