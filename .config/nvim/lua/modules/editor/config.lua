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
end

function config.toggleterm()
  local toggleterm = require('toggleterm')

  toggleterm.setup {
    size = 20,
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

  vim.cmd([[autocmd FileType python nnoremap <leader>d :TermExec cmd='python3 %'<CR>]])
  vim.cmd([[autocmd FileType c nnoremap <leader>d :TermExec cmd='gcc % -o %<.out && ./%<.out'<CR>]])
  vim.cmd(
    [[autocmd FileType cpp,cc nnoremap <leader>d :TermExec cmd='g++ % -o %<.out && ./%<.out'<CR>]]
  )
end

function config.colorizer()
  require('colorizer').setup { '*' }
end

return config
