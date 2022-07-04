local config = {}

function config.material()
  vim.g.material_style = 'deep ocean'
  vim.cmd('colorscheme material')
end

function config.kanagawa()
  vim.cmd('colorscheme kanagawa')
end

function config.tokyonight()
  vim.g.tokyonight_style = 'night'
  vim.cmd('colorscheme tokyonight')
end

function config.dracula()
  vim.cmd('colorscheme dracula')
end

function config.shades_of_purple()
  vim.cmd('colorscheme shades_of_purple')
end

function config.catppuccin()
  vim.g.catppuccin_flavour = 'mocha'
  require('catppuccin').setup {
    integration = {
      nvimtree = {
        enabled = true,
        show_root = true,
      },
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      hop = true,
      markdown = true,
      gitsigns = true,
      treesitter = true,
      bufferline = true,
    },
  }
  vim.cmd('colorscheme catppuccin')
end

function config.rose_pine()
  vim.cmd('colorscheme rose_pine')
end

function config.lualine()
  require('modules.ui.bubbles')
end

function config.nvim_bufferline()
  require('bufferline').setup {
    options = {
      numbers = 'ordinal',
      max_name_length = 30,

      close_icon = '',
      modified_icon = '●',
      indicator_icon = '▎',
      buffer_close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',

      offsets = {
        {
          filetype = 'NvimTree',
          text = 'NvimTree',
          highlight = 'Directory',
          padding = 1,
        },
      },
    },
  }
end

function config.nvim_tree()
  require('nvim-tree').setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = false,
    },
    update_focused_file = {
      enable = true,
      ignore_list = {},
    },
    system_open = {
      cmd = nil,
      args = {},
    },
    renderer = {
      highlight_git = false,
      icons = {
        show = {
          git = false,
        },
      },
    },
    filters = {
      dotfiles = false,
      custom = { '.DS_Store' },
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 1000,
    },
    view = {
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = 'left',
      mappings = {
        custom_only = false,
        list = {},
      },
      number = false,
      relativenumber = false,
      signcolumn = 'yes',
    },
    trash = {
      cmd = 'rip',
      require_confirm = true,
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

      ['n gj'] = { expr = true, "<cmd>lua require('gitsigns').next_hunk()<CR>" },
      ['n gk'] = { expr = true, "<cmd>lua require('gitsigns').prev_hunk()<CR>" },

      ['n gp'] = { "<cmd>lua require'gitsigns'.preview_hunk()<CR>" },
      ['n gB'] = { "<cmd>lua require'gitsigns'.blame_line()<CR>" },
      ['n gdi'] = { "<cmd>lua require'gitsigns'.diffthis()<CR>" },
      ['n gDi'] = { "<cmd>lua require'gitsigns'.diffthis('~')<CR>" },
      ['n gh'] = { "<cmd>lua require'gitsigns'.toggle_deleted()<CR>" },
    },
  }
end

return config
