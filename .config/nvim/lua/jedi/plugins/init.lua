local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print('Installing packer close and reopen Neovim...')
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- TODO: source config when a file in nvim config dir changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  vim.notify('Cannot load packer!')
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

packer.startup(function(use)
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'wbthomason/packer.nvim' }

  -- Themes
  use { 'marko-cerovac/material.nvim' }
  use { 'folke/tokyonight.nvim', opt = true }
  use { 'Mofiqul/dracula.nvim', opt = true }
  use { 'Rigellute/shades-of-purple.vim', opt = true } -- vim
  use { 'catppuccin/nvim', as = 'catppuccin', opt = true }
  use { 'rose-pine/neovim', as = 'rose-pine', opt = true }

  -- Aesthetics
  use { 'hoob3rt/lualine.nvim' }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'kyazdani42/nvim-web-devicons' }

  -- Navigation
  use { 'phaazon/hop.nvim' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }

  -- life made easy plugins
  use { 'windwp/nvim-autopairs' }
  use { 'numToStr/Comment.nvim' }
  use { 'akinsho/toggleterm.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Git
  -- use { 'dstein64/vim-startuptime' }
  -- use { 'jedi2610/nvim-rooter.lua' }
  use {
    '/mnt/Seagate/Code/nvim-rooter.lua',
    config = function()
      require('nvim-rooter').setup {
        rooter_patterns = { '.git', '.hg', '.svn' },
        trigger_patterns = { '*' },
        manual = false,
      }
    end,
  }
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- utils
  use { 'vimwiki/vimwiki', cmd = 'VimwikiStart' }

  -- cmp & lsp
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-path' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'neovim/nvim-lspconfig' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'jose-elias-alvarez/null-ls.nvim' }

  -- Misc
  use { 'lewis6991/impatient.nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- lazy load
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    ft = { 'markdown' },
  }
  use {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    config = function()
      require('jedi.plugins.config.zen-mode').config()
    end,
  }
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    cmd = { 'TodoLocList', 'TodoTelescope' },
    config = function()
      require('jedi.plugins.config.todo-comments').config()
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

require('jedi.plugins.config').setup()

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap('n', '<leader>l', ":lua require('jedi.plugins.lsp').setup()<CR>", opts)
