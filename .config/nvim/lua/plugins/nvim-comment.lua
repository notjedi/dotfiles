require('nvim_comment').setup({
      -- Linters prefer comment and line to have a space in between markers
      marker_padding = true,
      -- Should key mappings be created
      create_mappings = true,
      -- should comment out empty or whitespace only lines
      -- comment_empty = false,
      -- Normal mode mapping left hand side
      -- line_mapping = "<C-_>",
      -- Visual/Operator mapping left hand side
      -- operator_mapping = "<leader>/"
})

vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap=true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap=true, silent = true})
