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

      formatting.jq,
      -- formatting.taplo,
      -- formatting.asmfmt,
      formatting.rustfmt,
      formatting.gofmt,
      -- formatting.fourmolu,
      -- formatting.mdformat,
      -- formatting.goimports,
      -- formatting.protolint,
      -- formatting.cabal_fmt,
      formatting.black.with { extra_args = { '-S', '-l 100' } },
      formatting.shfmt.with { extra_args = { '-i 2', '-ci', '-sr' } },
      -- formatting.golines.with { extra_args = { '--base-formatter="goimports"' } },
      -- formatting.isort.with { extra_args = { '--profile black' } },
      formatting.clang_format.with { extra_args = { '-style="{IndentWidth: 4}"' } },
      -- formatting.prettier.with {
      --   extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
      -- },
      formatting.stylua.with {
        extra_args = { '--config-path', vim.fn.expand('~/.config/stylua.toml') },
      },

      diagnostics.zsh,
      -- diagnostics.yamllint,
      diagnostics.cppcheck,
      diagnostics.codespell,
      diagnostics.pydocstyle,
      diagnostics.shellcheck,
      -- diagnostics.buf,
      -- diagnostics.mypy,
      -- diagnostics.pylint,
      -- diagnostics.gitlint,
      -- diagnostics.misspell,
      -- diagnostics.protolint,
      -- diagnostics.actionlint,
      -- diagnostics.write_good,
      -- diagnostics.staticcheck,
      -- diagnostics.protoc_gen_lint,
      diagnostics.golangci_lint,
      diagnostics.luacheck.with { extra_args = { '-g' } },
      diagnostics.flake8.with {
        extra_args = { '--max-line-length', 100, '--ignore', 'E265,E266' },
      },

      completion.spell.with { filetypes = { 'markdown', 'text' } },
      hover.dictionary.with { filetypes = { 'markdown', 'text' } },
    },
  }
end

function config.mkdnflow()
  require('mkdnflow').setup {
    links = {
      conceal = true,
      transform_explicit = function(text)
        text = text:gsub(' ', '-')
        text = text:lower()
        return text
      end,
    },
    use_mappings_table = true,
    mappings = {
      MkdnNextLink = { 'n', '<Tab>' },
      MkdnPrevLink = { 'n', '<S-Tab>' },
      MkdnNextHeading = { 'n', '<leader>]' },
      MkdnPrevHeading = { 'n', '<leader>[' },
      MkdnGoBack = { 'n', '\\\\' },
      MkdnGoForward = { 'n', '||' },
      MkdnFollowLink = { { 'n', 'v' }, '<CR>' },
      MkdnDestroyLink = { 'n', '<M-CR>' },
      MkdnMoveSource = { 'n', '<F2>' },
      MkdnYankAnchorLink = { 'n', 'ya' },
      MkdnYankFileAnchorLink = { 'n', 'yfa' },
      MkdnIncreaseHeading = { 'n', '+' },
      MkdnDecreaseHeading = { 'n', '-' },
      MkdnToggleToDo = { { 'n', 'v' }, '<C-Space>' },
      MkdnNewListItem = false,
      MkdnExtendList = false,
      MkdnUpdateNumbering = { 'n', '<leader>nn' },
      MkdnTableNextCell = { 'i', '<Tab>' },
      MkdnTablePrevCell = { 'i', '<S-Tab>' },
      MkdnTableNextRow = false,
      MkdnTablePrevRow = { 'i', '<M-CR>' },
      MkdnTableNewRowBelow = { 'n', '<leader>ir' },
      MkdnTableNewRowAbove = { 'n', '<leader>iR' },
      MkdnTableNewColAfter = { 'n', '<leader>ic' },
      MkdnTableNewColBefore = { 'n', '<leader>iC' },
      MkdnCR = false,
      MkdnTab = false,
      MkdnSTab = false,
    },
  }
end

return config
