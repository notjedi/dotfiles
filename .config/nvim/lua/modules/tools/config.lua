local config = {}

function config.autopairs()
  require('nvim-autopairs').setup {
    map_cr = false,
    enable_check_bracket_line = true,
  }
end

function config.comment()
  require('Comment').setup {
    padding = true,
    sticky = true,
    ignore = nil,

    toggler = {
      line = '<leader>c',
      block = '<leader>b',
    },

    opleader = {
      line = 'gc',
      block = 'gb',
    },

    extra = {
      above = 'gcO',
      below = 'gco',
      eol = 'gcA',
    },

    mappings = {
      basic = true,
      extra = true,
      extended = false,
    },

    pre_hook = nil,
    post_hook = nil,
  }
end

function config.rooter()
  require('nvim-rooter').setup {
    rooter_patterns = { '.git', '.hg', '.svn' },
    trigger_patterns = { '*' },
    manual = false,
  }
end

function config.zenmode()
  require('zen-mode').setup {
    window = {
      width = 0.75,
      height = 0.75,
    },
  }
end

function config.todo_comments()
  require('todo-comments').setup {
    keywords = {
      FIX = {
        icon = ' ',
        color = 'error',
        alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
      },
      TODO = { icon = ' ', color = 'info' },
      HACK = { icon = ' ', color = 'warning', signs = false },
      WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
      PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' }, signs = false },
      NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
    },

    highlight = {
      before = '',
      keyword = 'bg',
      after = 'fg',
      pattern = [[.*<(KEYWORDS)\s*:]],
      comments_only = true,
      max_line_len = 400,
      exclude = {},
    },

    colors = {
      error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
      warning = { 'DiagnosticWarning', 'WarningMsg', '#FBBF24' },
      info = { 'DiagnosticInfo', '#2563EB' },
      hint = { 'DiagnosticHint', '#10B981' },
      default = { 'Identifier', '#7C3AED' },
    },
  }
end

function config.gitsigns()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd([[packadd plenary.nvim]])
  end

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

    keymaps = {
      noremap = true,
      buffer = true,

      ['n gdi'] = { "<cmd>lua require'gitsigns'.diffthis()<CR>" },
      ['n gB'] = { "<cmd>lua require'gitsigns'.blame_line()<CR>" },
      ['n gj'] = { "<cmd>lua require('gitsigns').next_hunk()<CR>" },
      ['n gk'] = { "<cmd>lua require('gitsigns').prev_hunk()<CR>" },
      ['n gp'] = { "<cmd>lua require'gitsigns'.preview_hunk()<CR>" },
      ['n gDi'] = { "<cmd>lua require'gitsigns'.diffthis('~')<CR>" },
      ['n gh'] = { "<cmd>lua require'gitsigns'.toggle_deleted()<CR>" },
    },
  }
end

function config.colorizer()
  require('colorizer').setup { '*' }
end

return config
