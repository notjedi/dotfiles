vim.wo.spell = true
vim.bo.spelllang = 'en_us'
vim.g.mkdp_browser = 'librewolf'

local keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }
keymap(0, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
