local package = require('core.pack').package
local conf = require('modules.editor.config')

package {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    { 'nvim-lua/popup.nvim', opt = true },
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
  },
}

package {
  'phaazon/hop.nvim',
  event = 'BufRead',
  config = conf.hop,
}

package {
  'akinsho/toggleterm.nvim',
  cmd = 'ToggleTerm',
  config = conf.toggleterm,
}

package {
  'norcalli/nvim-colorizer.lua',
  event = 'BufRead',
  config = conf.colorizer,
}

package { 'antoinemadec/FixCursorHold.nvim', event = 'BufReadPre' }
