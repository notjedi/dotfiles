-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
-- https://github.com/catppuccin/palette/blob/main/lib/builder.lua
-- https://github.com/catppuccin/palette/blob/main/scss/Catppuccin.scss
local colors = {
  mauve   = '#DDB6F2',
  green   = '#ABE9B3',
  black   = '#1E1E2E',
  white   = '#C6D0F5',
  red     = '#F28FAD',
  pink    = '#F5C2E7',
  grey    = '#36374A',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.pink },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.mauve } },
  visual = { a = { fg = colors.black, bg = colors.green } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

local branch = {
  'branch',
  icon = '',
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'dashboard', 'NvimTree', 'Outline' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename', branch },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'diff', 'filetype', 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
