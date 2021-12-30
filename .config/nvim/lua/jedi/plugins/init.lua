local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- TODO: source config when a file in nvim config dir changes
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Cannot load packer!")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

packer.startup(function(use)

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'wbthomason/packer.nvim'

  -- Themes
  use 'kaicataldo/material.vim'
  use { 'chriskempson/base16-vim', opt = true }
  use { 'folke/tokyonight.nvim', opt = true }
  use { 'Rigellute/shades-of-purple.vim', opt = true }
  use { 'dracula/vim', as = 'dracula', opt = true }
  use { 'catppuccin/nvim', as = 'catppuccin', opt = true }

  -- Aesthetics
  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-web-devicons'
  use 'norcalli/nvim-colorizer.lua'

  -- Navigation
  use 'phaazon/hop.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use { 'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use { 'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Git
  use { 'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use { 'airblade/vim-rooter',
    opt = true,
    cmd = { 'Rooter', 'RooterToggle' }
  }

  -- Misc
  use 'lewis6991/impatient.nvim'
  use 'akinsho/toggleterm.nvim'
  use { 'junegunn/goyo.vim', cmd = 'Goyo', opt = true }
  use { 'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    ft = { 'markdown' },
    opt = true
  }
  use { 'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
  }
  use { 'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    opt = true,
    cmd = { 'TodoLocList', 'TodoTelescope' },
    config = function()
      require('jedi.plugins.config.todo-comments').config()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

require 'jedi.plugins.config'.setup()
