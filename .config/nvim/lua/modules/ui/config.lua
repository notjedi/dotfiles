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

return config
