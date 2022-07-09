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
  cmd = {
    'HopWordCurrentLineAC',
    'HopWordCurrentLineBC',
    'HopWordAC',
    'HopWordBC',
    'HopLineStartAC',
    'HopLineStartBC',
  },
  config = conf.hop,
}

package {
  'akinsho/toggleterm.nvim',
  cmd = { 'ToggleTerm', 'TermExec' },
  config = conf.toggleterm,
}

package {
  'kyazdani42/nvim-tree.lua',
  cmd = { 'NvimTreeToggle', 'NvimTreeFindFileToggle' },
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons',
}

package { 'antoinemadec/FixCursorHold.nvim', event = 'BufReadPre' }
