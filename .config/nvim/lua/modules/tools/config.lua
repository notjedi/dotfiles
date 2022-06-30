local config = {}

function config.autopairs()
  require('nvim-autopairs').setup {
    map_cr = false,
    enable_check_bracket_line = true,
  }
end

function config.comment()
  require('Comment').setup {
    padding = true,
    sticky = true,
    ignore = nil,

    toggler = {
      line = '<leader>c',
      block = '<leader>b',
    },

    opleader = {
      line = 'gc',
      block = 'gb',
    },

    extra = {
      above = 'gcO',
      below = 'gco',
      eol = 'gcA',
    },

    mappings = {
      basic = true,
      extra = true,
      extended = false,
    },

    pre_hook = nil,
    post_hook = nil,
  }
end

function config.null_ls()
  local null_ls = require('null-ls')
  local diagnostics = null_ls.builtins.diagnostics
  local formatting = null_ls.builtins.formatting
  local completion = null_ls.builtins.completion
  local hover = null_ls.builtins.hover

  null_ls.setup {
    debug = false,
    sources = {
      formatting.prettier.with {
        extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
      },
      formatting.rustfmt,
      formatting.black.with { extra_args = { '-S', '-l 100' } },
      formatting.shfmt.with { extra_args = { '-i 2', '-ci', '-sr' } },
      formatting.clang_format.with { extra_args = { '-style="{IndentWidth: 4}"' } },
      formatting.stylua.with {
        extra_args = { '--config-path', vim.fn.expand('~/.config/stylua.toml') },
      },

      diagnostics.flake8.with {
        extra_args = { '--max-line-length', 100, '--ignore', 'E265,E266' },
      },
      diagnostics.luacheck,
      diagnostics.cppcheck,
      diagnostics.codespell,
      diagnostics.pydocstyle,
      diagnostics.shellcheck,

      completion.spell.with { filetypes = { 'markdown', 'txt', 'vimwiki' } },
      hover.dictionary.with { filetypes = { 'markdown', 'txt', 'vimwiki' } },
    },
  }

  -- local keymap = vim.api.nvim_set_keymap
  -- local opts = { noremap = true, silent = true }
  -- keymap('n', '<leader>F', ':lua vim.lsp.buf.formatting_sync()<CR>', opts)
end

function config.impatient()
  require('impatient')
end

function config.zenmode()
  require('zen-mode').setup {
    window = {
      width = 0.75,
      height = 0.75,
    },
  }
end

function config.todo_comments()
  require('todo-comments').setup {
    keywords = {
      FIX = {
        icon = ' ',
        color = 'error',
        alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
      },
      TODO = { icon = ' ', color = 'info' },
      HACK = { icon = ' ', color = 'warning', signs = false },
      WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
      PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' }, signs = false },
      NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
    },

    highlight = {
      before = '',
      keyword = 'bg',
      after = 'fg',
      pattern = [[.*<(KEYWORDS)\s*:]],
      comments_only = true,
      max_line_len = 400,
      exclude = {},
    },

    colors = {
      error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
      warning = { 'DiagnosticWarning', 'WarningMsg', '#FBBF24' },
      info = { 'DiagnosticInfo', '#2563EB' },
      hint = { 'DiagnosticHint', '#10B981' },
      default = { 'Identifier', '#7C3AED' },
    },
  }
end

return config
