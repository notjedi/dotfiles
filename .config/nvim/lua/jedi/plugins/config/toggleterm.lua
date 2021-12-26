toggleterm = require('toggleterm')

toggleterm.setup({
	size = 20,
	open_mapping = [[<leader>t]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = false,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
  local buf_keymap = vim.api.nvim_buf_set_keymap
  local opts = { silent = true, noremap = true }
  buf_keymap(0, 't', '<leader>t', [[<C-\><C-n>:ToggleTerm<CR>]], opts)
  buf_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  buf_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  buf_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  buf_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd([[autocmd! TermOpen term://* lua set_terminal_keymaps()]])
vim.cmd([[autocmd FileType python nnoremap <Leader>d :TermExec cmd='python3 %'<CR>]])
vim.cmd([[autocmd FileType cpp,cc nnoremap <Leader>d :TermExec cmd='g++ % -o %<.out && ./%<.out'<CR>]])
vim.cmd([[autocmd FileType c nnoremap <Leader>d :TermExec cmd='gcc % -o %<.out && ./%<.out'<CR>]])
