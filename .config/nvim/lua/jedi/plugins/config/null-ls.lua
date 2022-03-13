local null_ls = require('null-ls')
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local hover = null_ls.builtins.hover

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with {
      extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
    },
    formatting.rustfmt,
    formatting.black.with { extra_args = { '-S', '-l 80' } },
    formatting.shfmt.with { extra_args = { '-i 2', '-ci', '-sr' } },
    formatting.clang_format.with { extra_args = { '-style="{IndentWidth: 4}"' } },
    formatting.stylua.with {
      extra_args = { '--config-path', vim.fn.expand('~/.config/stylua.toml') },
    },

    diagnostics.flake8,
    diagnostics.luacheck,
    diagnostics.cppcheck,
    diagnostics.codespell,
    diagnostics.pydocstyle,
    diagnostics.shellcheck,

    completion.spell.with { filetypes = { 'md', 'txt' } },
    hover.dictionary,
  },
}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap('n', '<leader>F', ':lua vim.lsp.buf.formatting_sync()<CR>', opts)
