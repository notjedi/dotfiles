local opts = {
  autoindent = true,
  backup = false,
  clipboard = 'unnamedplus',
  cmdheight = 1,
  completeopt = { 'menu', 'noselect' },
  conceallevel = 0,
  cursorline = true,
  dictionary = '/usr/share/dict/words',
  expandtab = true,
  fileencoding = 'utf-8',
  foldenable = false,
  grepformat = '%f:%l:%c:%m',
  grepprg = 'rg --hidden --vimgrep --smart-case --',
  guicursor = 'i:block',
  hlsearch = true,
  ignorecase = true,
  mouse = 'a',
  number = true,
  numberwidth = 4,
  pumheight = 10,
  relativenumber = false,
  scrolloff = 5,
  shada = "!,'300,<50,@100,s10,h",
  shiftwidth = 4,
  showmode = false,
  showtabline = 2,
  sidescrolloff = 10,
  signcolumn = 'yes',
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 4,
  termguicolors = true,
  textwidth = 100,
  timeoutlen = 500,
  undofile = true,
  updatetime = 300,
  wrap = false,
}

for key, value in pairs(opts) do
  vim.opt[key] = value
end

-- https://www.reddit.com/r/neovim/comments/xw2vjy/comment/ir4ecuz/
vim.g.do_filetype_lua = true
vim.g.did_load_filetypes = false

vim.opt.shortmess:append('c')
vim.cmd('set iskeyword+=-')
vim.cmd('syntax on')
vim.cmd('xnoremap p "_dP')
