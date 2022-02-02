require("hop").setup()

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "f", ":HopWordCurrentLineAC<CR>", opts)
keymap("n", "F", ":HopWordCurrentLineBC<CR>", opts)
keymap("n", "s", ":HopWordAC<CR>", opts)
keymap("n", "S", ":HopWordBC<CR>", opts)
