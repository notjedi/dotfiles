local config = {}

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  require('nvim-treesitter.configs').setup {
    ensure_installed = 'all',
    ignore_install = { 'phpdoc' },
    indent = { enable = true },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'org' },
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    },
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
      formatting.jq,
      formatting.gofmt,
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
      diagnostics.golangci_lint,

      completion.spell.with { filetypes = { 'markdown', 'txt', 'vimwiki' } },
      hover.dictionary.with { filetypes = { 'markdown', 'txt', 'vimwiki' } },
    },
  }
end

return config
