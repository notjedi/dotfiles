require("bufferline").setup{
  options = {
    max_name_length = 30,

    close_icon = "",
    modified_icon = "●",
    indicator_icon = "▎",
    buffer_close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",

    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        padding = 1
      }
    }
  }
}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
keymap('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)
keymap('n', '<C-x>', ':bdelete<CR>', opts)
