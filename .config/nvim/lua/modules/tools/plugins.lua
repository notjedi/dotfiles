local package = require('core.pack').package
local conf = require('modules.tools.config')

package {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = conf.autopairs,
}

package {
  'numToStr/Comment.nvim',
  event = { 'InsertEnter' },
  config = conf.comment,
}

package {
  'norcalli/nvim-colorizer.lua',
  cmd = { 'ColorizerToggle', 'ColorizerAttachToBuffer' },
  config = conf.colorizer,
}

package {
  'lewis6991/gitsigns.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.gitsigns,
  requires = { 'nvim-lua/plenary.nvim', opt = true },
}

package { 'notjedi/nvim-rooter.lua', event = 'CursorMoved', config = conf.rooter }

package {
  'folke/zen-mode.nvim',
  cmd = 'ZenMode',
  config = conf.zenmode,
}

package {
  'folke/todo-comments.nvim',
  requires = 'nvim-lua/plenary.nvim',
  cmd = { 'TodoLocList', 'TodoTelescope' },
  config = conf.todo_comments,
}
