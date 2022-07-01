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

package { 'Vonr/align.nvim', opt = true }
package { 'notjedi/nvim-rooter.lua', event = 'CursorMoved', config = conf.rooter }

package {
  'jose-elias-alvarez/null-ls.nvim',
  event = 'InsertEnter',
  config = conf.null_ls,
}

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
