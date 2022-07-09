local package = require('core.pack').package
local conf = require('modules.ui.config')

-- colorscheme
package { 'catppuccin/nvim', as = 'catppuccin', config = conf.catppuccin }
package { 'marko-cerovac/material.nvim', cmd = 'LoadColors', config = conf.material }
package { 'rebelot/kanagawa.nvim', cmd = 'LoadColors', config = conf.kanagawa }
package { 'folke/tokyonight.nvim', cmd = 'LoadColors', config = conf.tokyonight }
package { 'Mofiqul/dracula.nvim', cmd = 'LoadColors', config = conf.dracula }
package { 'Rigellute/shades-of-purple.vim', cmd = 'LoadColors', config = conf.shades_of_purple } -- vim
package { 'rose-pine/neovim', as = 'rose-pine', cmd = 'LoadColors', config = conf.rose_pine }

package {
  'nvim-lualine/lualine.nvim',
  event = 'BufEnter',
  config = conf.lualine,
  requires = 'kyazdani42/nvim-web-devicons',
}

package {
  'akinsho/nvim-bufferline.lua',
  event = 'BufEnter',
  config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons',
}
