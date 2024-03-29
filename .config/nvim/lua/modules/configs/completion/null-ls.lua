-- return function()
-- 	local null_ls = require("null-ls")
-- 	local mason_null_ls = require("mason-null-ls")
-- 	local btnf = null_ls.builtins.formatting
-- 	local btnd = null_ls.builtins.diagnostics
-- 	local null_reg = null_ls.register

-- 	null_ls.setup({
-- 		debug = false,
-- 		update_in_insert = false,
-- 		diagnostics_format = "[#{s} #{c}] #{m}",
-- 	})

-- 	mason_null_ls.setup({
-- 		ensure_installed = require("core.settings").null_ls,
-- 		automatic_installation = true,
-- 		automatic_setup = true,
-- 	})

-- 	-- NOTE: Users don't need to specify null-ls sources if using only default config.
-- 	-- "mason-null-ls" will auto-setup for users.
-- 	mason_null_ls.setup({
-- 		handlers = {
-- 			black = function()
-- 				null_reg(btnf.black.with({ extra_args = { "--fast" } }))
-- 			end,
-- 			shfmt = function()
-- 				null_reg(btnf.shfmt.with({}))
-- 			end,
-- 			markdownlint = function()
-- 				null_reg(btnd.markdownlint.with({ extra_args = { "--disable MD033" } }))
-- 			end,
-- 			-- example for changing diagnostics_format
-- 			-- shellcheck = function()
-- 			-- 	null_reg(btnd.shellcheck.with({ diagnostics_format = "#{m} [#{s} #{c}]" }))
-- 			-- end,
-- 		},
-- 	})

-- 	require("completion.formatting").configure_format_on_save()
-- end

return function()
	local null_ls = require("null-ls")
	local mason_null_ls = require("mason-null-ls")
	local btns = null_ls.builtins

	-- Please set additional flags for the supported servers here
	-- Don't specify any config here if you are using the default one.
	local sources = {
		btns.formatting.black.with({
			extra_args = { "--fast" },
		}),
		btns.formatting.shfmt,
		-- btns.formatting.shfmt.with({
		-- 	args = { "-i 2", "-ci", "-sr", "-filename", "$FILENAME" },
		-- }),
		btns.formatting.prettier.with({
			filetypes = {
				"vue",
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
				"yaml",
				"html",
				"css",
				"scss",
				"sh",
				"markdown",
			},
		}),
	}

	null_ls.setup({
		border = "rounded",
		debug = false,
		log_level = "warn",
		update_in_insert = false,
		sources = sources,
	})

	mason_null_ls.setup({
		ensure_installed = require("core.settings").null_ls_deps,
		automatic_installation = false,
		automatic_setup = true,
		handlers = {},
	})

	require("completion.formatting").configure_format_on_save()
end
