local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
  -- normal
  ['n|cl'] = map_cmd('veu'),
  ['n|cu'] = map_cmd('veU'),
  ['n|Y'] = map_cmd('y$'),
  ['n|W'] = map_cr('w!'),
  ['n|Q'] = map_cr('q!'),
  ['n|<C-q>'] = map_cr('wq'),
  ['n|<C-x>'] = map_cr('bdelete'):with_noremap():with_silent(),
  ['n|<C-h>'] = map_cmd('<C-w>h'):with_noremap(),
  ['n|<C-l>'] = map_cmd('<C-w>l'):with_noremap(),
  ['n|<C-j>'] = map_cmd('<C-w>j'):with_noremap(),
  ['n|<C-k>'] = map_cmd('<C-w>k'):with_noremap(),
  ['n|<C-Up>'] = map_cr('resize +2'):with_noremap():with_silent(),
  ['n|<C-Down>'] = map_cr('resize -2'):with_noremap():with_silent(),
  ['n|<C-Right>'] = map_cr('vertical +2'):with_noremap():with_silent(),
  ['n|<C-Left>'] = map_cr('vertical -2'):with_noremap():with_silent(),
  ['n|<leader>ss'] = map_cu('SessionSave'):with_noremap(),
  ['n|<leader>sl'] = map_cu('SessionLoad'):with_noremap(),
  ['n|<leader>tw'] = map_cmd([[:%s/\s\+$//e<CR> :%s/\n\+\%$//e<CR>]]):with_noremap(),
  ['n|<leader>w'] = map_cu('write'):with_noremap(),
  ['n|<leader>q'] = map_cu('quit'):with_noremap(),

  -- insert
  ['i|<C-h>'] = map_cmd('<BS>'):with_noremap(),
  ['i|<C-d>'] = map_cmd('<Del>'):with_noremap(),
  ['i|<C-u>'] = map_cmd('<C-G>u<C-U>'):with_noremap(),
  ['i|<C-b>'] = map_cmd('<Left>'):with_noremap(),
  ['i|<C-f>'] = map_cmd('<Right>'):with_noremap(),
  ['i|<C-a>'] = map_cmd('<esc>^i'):with_noremap(),
  ['i|<C-j>'] = map_cmd('<esc>o'):with_noremap(),
  ['i|<C-k>'] = map_cmd('<esc>O'):with_noremap(),
  ['i|<C-e>'] = map_cmd([[pumvisible() ? "\<C-e>" : "\<End>"]]):with_noremap():with_expr(),
  ['i|<esc>'] = map_cmd('<esc>l'):with_noremap(),

  -- Autocomplete stuff
  -- keymap('i', '<C- >', '<C-x><C-p>', opts)
  -- keymap('i', '<C-p>', '<C-x><C-o>', opts)
  -- keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', auto_opts)
  -- keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', auto_opts)
  -- keymap('i', '<C-j>', 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', auto_opts)
  -- keymap('i', '<C-k>', 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', auto_opts)
  -- keymap('i', '<CR>', 'pumvisible() ? "\\<C-y>" : "\\<CR>"', auto_opts)

  -- visual
  ['v|<'] = map_cmd('<gv'):with_noremap():with_silent(),
  ['v|>'] = map_cmd('>gv'):with_noremap():with_silent(),
  ['v|<C-j>'] = map_cmd(':m .+1<CR>=='):with_noremap():with_silent(),
  ['v|<C-k>'] = map_cmd(':m .-2<CR>=='):with_noremap():with_silent(),

  -- visual block
  ['x|<C-j>'] = map_cmd(":move '>+1<CR>gv-gv"):with_noremap():with_silent(),
  ['x|<C-k>'] = map_cmd(":move '<-2<CR>gv-gv"):with_noremap():with_silent(),

  -- command
  ['c|<C-b>'] = map_cmd('<Left>'):with_noremap(),
  ['c|<C-f>'] = map_cmd('<Right>'):with_noremap(),
  ['c|<C-a>'] = map_cmd('<Home>'):with_noremap(),
  ['c|<C-e>'] = map_cmd('<End>'):with_noremap(),
  ['c|<C-d>'] = map_cmd('<Del>'):with_noremap(),
  ['c|<C-h>'] = map_cmd('<BS>'):with_noremap(),
  ['c|<C-t>'] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
}

bind.nvim_load_mapping(def_map)
