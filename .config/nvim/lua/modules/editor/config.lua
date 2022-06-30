local config = {}

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd([[packadd plenary.nvim]])
    vim.cmd([[packadd popup.nvim]])
    vim.cmd([[packadd telescope-fzy-native.nvim]])
  end

  local actions = require('telescope.actions')
  require('telescope').setup {
    defaults = {
      prompt_prefix = '🔭 ',
      selection_caret = '➜ ',
      file_ignore_patterns = { '.git', '.pth', 'events.out.*', '.jpg', '.png', '.jpeg' },

      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
      },

      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

      mappings = {
        i = {
          ['<C-n>'] = actions.cycle_history_next,
          ['<C-p>'] = actions.cycle_history_prev,
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<Tab>'] = actions.move_selection_next,
          ['<S-Tab>'] = actions.move_selection_previous,
        },

        n = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<Tab>'] = actions.move_selection_next,
          ['<S-Tab>'] = actions.move_selection_previous,
        },
      },
    },

    pickers = {
      find_files = {
        hidden = true,
      },
    },

    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  }
  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('dotfiles')
end

function config.hop()
  require('hop').setup()

  local keymap = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  keymap('n', 'f', ':HopWordCurrentLineAC<CR>', opts)
  keymap('n', 'F', ':HopWordCurrentLineBC<CR>', opts)
  keymap('n', 's', ':HopWordAC<CR>', opts)
  keymap('n', 'S', ':HopWordBC<CR>', opts)
end

function config.toggleterm()
  local toggleterm = require('toggleterm')

  toggleterm.setup {
    size = 20,
    open_mapping = [[<leader>t]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = false,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = 'curved',
      winblend = 0,
      highlights = {
        border = 'Normal',
        background = 'Normal',
      },
    },
  }

  function _G.set_terminal_keymaps()
    local buf_keymap = vim.api.nvim_buf_set_keymap
    local opts = { silent = true, noremap = true }
    buf_keymap(0, 't', '<leader>t', [[<C-\><C-n>:ToggleTerm<CR>]], opts)
    buf_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    buf_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    buf_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    buf_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  end

  vim.cmd([[autocmd! TermOpen term://* lua set_terminal_keymaps()]])
  vim.cmd([[autocmd FileType python nnoremap <Leader>d :TermExec cmd='python3 %'<CR>]])
  vim.cmd(
    [[autocmd FileType cpp,cc nnoremap <Leader>d :TermExec cmd='g++ % -o %<.out && ./%<.out'<CR>]]
  )
  vim.cmd([[autocmd FileType c nnoremap <Leader>d :TermExec cmd='gcc % -o %<.out && ./%<.out'<CR>]])
end

function config.colorizer()
  require('colorizer').setup { '*' }
end

return config
