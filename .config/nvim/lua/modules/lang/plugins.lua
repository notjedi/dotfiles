local package = require('core.pack').package
local conf = require('modules.lang.config')

package {
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
}

package { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }

package {
  'jose-elias-alvarez/null-ls.nvim',
  event = 'InsertEnter',
  config = conf.null_ls,
}
