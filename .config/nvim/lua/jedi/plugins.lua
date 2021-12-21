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
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
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

return packer.startup(function(use)

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'wbthomason/packer.nvim'

  -- Themes
  use 'dracula/vim'
  use 'dylanaraps/wal.vim'
  use 'jaredgorski/spacecamp'
  use 'folke/tokyonight.nvim'
  use 'kaicataldo/material.vim'
  use 'Rigellute/shades-of-purple.vim'
  use {
    'catppuccin/nvim',
    as = 'catppuccin'
  }

  -- Aesthetics 
  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-web-devicons'
  use 'junegunn/rainbow_parentheses.vim'
  use 'norcalli/nvim-colorizer.lua'

  -- Navigation
  use 'phaazon/hop.nvim'
  use 'kyazdani42/nvim-tree.lua'

  -- Git
  use 'airblade/vim-rooter'

  -- Misc
  use {'junegunn/goyo.vim', cmd = 'Goyo'}
  use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install', cmd = 'MarkdownPreview'}

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
