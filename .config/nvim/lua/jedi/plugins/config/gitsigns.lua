require('gitsigns').setup {
  signs = {
    add = { hl = 'GitSignsAdd', text = '▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    change = {
      hl = 'GitSignsChange',
      text = '▎',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
    delete = {
      hl = 'GitSignsDelete',
      text = '契',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    topdelete = {
      hl = 'GitSignsDelete',
      text = '契',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    changedelete = {
      hl = 'GitSignsChange',
      text = '▎',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
  },

  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },

  attach_to_untracked = true,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 100,
    ignore_whitespace = false,
  },

  current_line_blame_formatter_opts = {
    relative_time = false,
  },

  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },

  yadm = {
    enable = false,
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, lhs, rhs, opts)
      opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', 'gj', ":lua require('gitsigns').next_hunk()<CR>")
    map('n', 'gk', ":lua require('gitsigns').prev_hunk()<CR>")

    -- Actions
    map('n', 'gS', ':Gitsigns stage_buffer<CR>')
    map('n', 'gR', ':Gitsigns reset_buffer<CR>')
    map('n', 'gp', ':Gitsigns preview_hunk<CR>')
    map('n', 'gB', ':Gitsigns blame_line<CR>')
    map('n', 'gdi', ':Gitsigns diffthis<CR>')
    map('n', 'gDi', ":lua require'gitsigns'.diffthis('~')<CR>")
    map('n', 'gh', ':Gitsigns toggle_deleted<CR>')
  end,
}
