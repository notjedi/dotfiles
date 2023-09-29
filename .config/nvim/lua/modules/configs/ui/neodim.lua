return function()
	local blend_color = require("modules.utils").hl_to_rgb("Normal", true)

	require("neodim").setup({
		alpha = 0.45,
		blend_color = blend_color,
		update_in_insert = {
			enable = true,
			delay = 100,
		},
		hide = {
			virtual_text = true,
			signs = false,
			underline = false,
		},
	})

	-- require("neodim").setup({
	--   refresh_delay = 75,
	--   alpha = 0.75,
	--   blend_color = "#000000",
	--   hide = {
	--     underline = true,
	--     virtual_text = true,
	--     signs = true,
	--   },
	--   regex = {
	--     "[uU]nused",
	--     "[nN]ever [rR]ead",
	--     "[nN]ot [rR]ead",
	--   },
	--   priority = 128,
	--   disable = {},
	-- })
end
