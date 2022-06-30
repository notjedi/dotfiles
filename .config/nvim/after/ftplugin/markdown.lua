vim.wo.spell = true
vim.bo.spelllang = 'en_us'
vim.g.mkdp_browser = 'librewolf'
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2

local keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }
keymap(0, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
