local opts = { noremap = true, silent = true }
local auto_opts = { silent = true, expr = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Leader keymaps
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Change case
keymap("n", "cu", "veU", opts)
keymap("n", "cl", "veu", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "<Esc>", "<Esc>l", opts) -- stop ESC from moving 1 char to the left

-- Autocomplete stuff
keymap("i", "<C- >", "<C-x><C-p>", opts)
keymap("i", "<C-p>", "<C-x><C-o>", opts)
keymap("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', auto_opts)
keymap("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', auto_opts)
keymap("i", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', auto_opts)
keymap("i", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', auto_opts)
keymap("i", "<CR>", 'pumvisible() ? "\\<C-y>" : "\\<CR>"', auto_opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-j>", ":m .+1<CR>==", opts)
keymap("v", "<C-k>", ":m .-2<CR>==", opts)
-- keymap('v', 'p', "'_dP", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)
