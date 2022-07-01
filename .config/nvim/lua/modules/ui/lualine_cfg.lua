local branch = {
  'branch',
  icon = '',
}

require('lualine').setup {
  options = {
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'dashboard', 'NvimTree', 'Outline' },
  },
  sections = {
    lualine_a = {
      { 'mode', right_padding = 2 },
    },
    lualine_b = { branch, 'filename' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'diff', 'filetype', 'progress' },
    lualine_z = {
      { 'location', left_padding = 2 },
    },
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
