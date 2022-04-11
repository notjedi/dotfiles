local M = {}

M.config = function()
  vim.g.vimwiki_list = {
    {
      path = '/mnt/Seagate/Code/vimwiki/',
      syntax = 'markdown',
      ext = '.md',
      auto_toc = 1,
      custom_wiki2html = '$GOPATH/bin/vimwiki-godown',
      custom_wiki2html_args = 'vimwiki/',
    },
  }

  vim.g.vimwiki_global_ext = 0
  vim.g.vimwiki_listsyms = '○◐●✓'
  vim.g.vimwiki_listsym_rejected = '✗'
  vim.vimwiki_table_auto_fmt = 1
  vim.g.vimwiki_key_mappings = { all_maps = 0 }

  local buf_keymap = vim.api.nvim_buf_set_keymap
  local opts = { noremap = true, silent = true }

  buf_keymap(0, 'n', '<leader>vs', ':VimwikiStart<CR>', opts)
  buf_keymap(0, 'n', '<leader>vw', ':VimwikiIndex<CR>', opts)
  buf_keymap(0, 'n', '<CR>', ':VimwikiFollowLink<CR>', opts)
end

return M
