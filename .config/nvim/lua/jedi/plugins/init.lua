local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print("Installing packer close and reopen Neovim...")
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
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use { "wbthomason/packer.nvim" }

  -- Themes
  use { "kaicataldo/material.vim" }
  use { "folke/tokyonight.nvim", opt = true }
  use { "chriskempson/base16-vim", opt = true }
  use { "dracula/vim", as = "dracula", opt = true }
  use { "Rigellute/shades-of-purple.vim", opt = true }
  use { "catppuccin/nvim", as = "catppuccin", opt = true }
  use { "rose-pine/neovim", as = "rose-pine", opt = true }

  -- Aesthetics
  use { "norcalli/nvim-colorizer.lua" }
  use { "kyazdani42/nvim-web-devicons" }

  -- Navigation
  use { "phaazon/hop.nvim" }
  use { "kyazdani42/nvim-tree.lua" }
  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }

  -- life made easy plugins
  use { "windwp/nvim-autopairs" }
  use { "akinsho/toggleterm.nvim" }
  use { "mhartington/formatter.nvim" }
  use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }

  -- Git
  use { "airblade/vim-rooter", cmd = { "Rooter", "RooterToggle" } }
  use { "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" }

  -- Misc
  use { "lewis6991/impatient.nvim" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "iamcco/markdown-preview.nvim", run = "cd app && npm install", ft = { "markdown" } }
  use {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = "require('jedi.plugins.config.zen-mode').config()",
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    cmd = { "TodoLocList", "TodoTelescope" },
    config = function()
      require("jedi.plugins.config.todo-comments").config()
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

require("jedi.plugins.config").setup()
