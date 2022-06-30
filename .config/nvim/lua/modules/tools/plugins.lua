local package = require('core.pack').package
local conf = require('modules.tools.config')

package {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = conf.autopairs,
}

package {
  'numToStr/Comment.nvim',
  event = { 'CursorMoved', 'InsertEnter' },
  config = conf.comment,
}

package { 'Vonr/align.nvim', opt = true }

package {
  'jose-elias-alvarez/null-ls.nvim',
  event = 'BufRead',
  config = conf.null_ls,
}

-- package {
--   'lewis6991/impatient.nvim',
--   config = conf.impatient,
-- }

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

-- TODO: write a new markdown preview plugin
-- package {'iamcco/markdown-preview.nvim',
--   ft = 'markdown',
--   config = function ()
--     vim.g.mkdp_auto_start = 0
--   end
-- }
