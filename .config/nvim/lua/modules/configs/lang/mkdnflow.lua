return function()
	require("mkdnflow").setup({
		links = {
			conceal = true,
			transform_explicit = function(text)
				text = text:gsub(" ", "-")
				text = text:lower()
				return text
			end,
		},
		use_mappings_table = true,
		mappings = {
			MkdnNextLink = { "n", "<Tab>" },
			MkdnPrevLink = { "n", "<S-Tab>" },
			MkdnNextHeading = { "n", "<leader>]" },
			MkdnPrevHeading = { "n", "<leader>[" },
			MkdnGoBack = { "n", "\\\\" },
			MkdnGoForward = { "n", "||" },
			MkdnFollowLink = { { "n", "v" }, "<CR>" },
			MkdnDestroyLink = { "n", "<M-CR>" },
			MkdnMoveSource = { "n", "<F2>" },
			MkdnYankAnchorLink = { "n", "ya" },
			MkdnYankFileAnchorLink = { "n", "yfa" },
			MkdnIncreaseHeading = { "n", "+" },
			MkdnDecreaseHeading = { "n", "-" },
			MkdnToggleToDo = { { "n", "v" }, "<C-Space>" },
			MkdnNewListItem = false,
			MkdnExtendList = false,
			MkdnUpdateNumbering = { "n", "<leader>nn" },
			MkdnTableNextCell = { "i", "<Tab>" },
			MkdnTablePrevCell = { "i", "<S-Tab>" },
			MkdnTableNextRow = false,
			MkdnTablePrevRow = { "i", "<M-CR>" },
			MkdnTableNewRowBelow = { "n", "<leader>ir" },
			MkdnTableNewRowAbove = { "n", "<leader>iR" },
			MkdnTableNewColAfter = { "n", "<leader>ic" },
			MkdnTableNewColBefore = { "n", "<leader>iC" },
			MkdnCR = false,
			MkdnTab = false,
			MkdnSTab = false,
		},
	})
end
