local status_ok, hop = pcall(require, "hop")
if not status_ok then
  vim.notify("Hop not available")
  return
end

hop.setup()
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "f", ":HopWordCurrentLineAC<CR>", opts)
keymap("n", "F", ":HopWordCurrentLineBC<CR>", opts)
keymap("n", "s", ":HopWordAC<CR>", opts)
keymap("n", "S", ":HopWordBC<CR>", opts)
