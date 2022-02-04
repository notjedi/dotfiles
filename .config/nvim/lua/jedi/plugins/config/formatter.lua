require('formatter').setup {
  filetype = {

    sh = {
      -- Shell Script Formatter
      function()
        return {
          exe = 'shfmt',
          args = { '-i', 2, '-ci', '-sr' },
          stdin = true,
        }
      end,
    },

    javascript = {
      -- prettier
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            '--single-quote',
          },
          stdin = true,
        }
      end,
    },

    lua = {
      -- stylua
      function()
        return {
          exe = 'stylua --indent-type Spaces --column-width 100 --call-parentheses NoSingleTable',
          args = {
            '--indent-width 2',
            '--quote-style AutoPreferSingle',
            '-',
          },
          stdin = true,
        }
      end,
    },

    cpp = {
      -- clang-format
      function()
        return {
          exe = 'clang-format',
          args = { '--assume-filename', vim.api.nvim_buf_get_name(0) },
          stdin = true,
          cwd = vim.fn.expand('%:p:h'), -- Run clang-format in cwd of the file.
        }
      end,
    },

    c = {
      -- clang-format
      function()
        return {
          exe = 'clang-format',
          args = { '--assume-filename', vim.api.nvim_buf_get_name(0) },
          stdin = true,
          cwd = vim.fn.expand('%:p:h'), -- Run clang-format in cwd of the file.
        }
      end,
    },

    haskell = {
      function()
        return {
          exe = 'hindent',
          args = { '--sort-imports' },
          stdin = true,
        }
      end,
    },

    python = {
      -- black
      function()
        return {
          exe = 'black',
          args = { '-S', '-l', 100, '-' },
          stdin = true,
        }
      end,
    },
  },
}

vim.api.nvim_exec(
  [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.c,*.js,*.hs,*.py,*.cpp,*.cc,*.lua FormatWrite
  augroup END
]],
  true
)
