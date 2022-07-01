local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args
require('keymap.config')

local plug_map = {
  -- packer
  ['n|<leader>pu'] = map_cr('PackerUpdate'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>pi'] = map_cr('PackerInstall'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>pc'] = map_cr('PackerCompile'):with_silent():with_noremap():with_nowait(),

  -- bufferline
  ['n|<leader>1'] = map_cr('BufferLineGoToBuffer 1'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>2'] = map_cr('BufferLineGoToBuffer 2'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>3'] = map_cr('BufferLineGoToBuffer 3'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>4'] = map_cr('BufferLineGoToBuffer 4'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>5'] = map_cr('BufferLineGoToBuffer 5'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>6'] = map_cr('BufferLineGoToBuffer 6'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>7'] = map_cr('BufferLineGoToBuffer 7'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>8'] = map_cr('BufferLineGoToBuffer 8'):with_silent():with_noremap():with_nowait(),
  ['n|<leader>9'] = map_cr('BufferLineGoToBuffer 9'):with_silent():with_noremap():with_nowait(),
  ['n|H'] = map_cr('BufferLineCyclePrev'):with_silent():with_noremap():with_nowait(),
  ['n|L'] = map_cr('BufferLineCycleNext'):with_silent():with_noremap():with_nowait(),

  -- nvim-tree
  ['n|<leader>e'] = map_cr('NvimTreeFindFileToggle'):with_noremap():with_silent(),

  -- telescope
  ['n|<leader>fb'] = map_cu('Telescope buffers'):with_noremap():with_silent(),
  ['n|<leader>fc'] = map_cu('Telescope command_history'):with_noremap():with_silent(),
  ['n|<leader>fa'] = map_cu('Telescope live_grep'):with_noremap():with_silent(),
  ['n|<leader>ff'] = map_cu('Telescope find_files'):with_noremap():with_silent(),
  ['n|<leader>fg'] = map_cu('Telescope git_files'):with_noremap():with_silent(),
  ['n|<leader>fw'] = map_cu('Telescope grep_string'):with_noremap():with_silent(),
  ['n|<leader>fh'] = map_cu('Telescope oldfiles'):with_noremap():with_silent(),
  ['n|<leader>fl'] = map_cu('Telescope loclist'):with_noremap():with_silent(),
  ['n|<leader>ft'] = map_cu('Telescope help_tags'):with_noremap():with_silent(),
  ['n|<leader>fd'] = map_cu('Telescope dotfiles path=' .. os.getenv('HDD') .. 'Code/dotfiles')
    :with_noremap()
    :with_silent(),

  -- hop
  ['n|s'] = map_cr('HopWordAC'):with_noremap():with_silent(),
  ['n|S'] = map_cr('HopWordBC'):with_noremap():with_silent(),
  ['n|t'] = map_cr('HopWordCurrentLineAC'):with_noremap():with_silent(),
  ['n|T'] = map_cr('HopWordCurrentLineBC'):with_noremap():with_silent(),
  ['n|<leader>l'] = map_cr('HopLineStartAC'):with_noremap():with_silent(),
  ['n|<leader>L'] = map_cr('HopLineStartBC'):with_noremap():with_silent(),

  -- toggleterm
  ['n|<leader>t'] = map_cr('ToggleTerm'):with_noremap():with_silent(),
  ['t|<C-h>'] = map_cmd([[<C-\><C-n><C-W>h]]):with_noremap():with_silent(),
  ['t|<C-j>'] = map_cmd([[<C-\><C-n><C-W>j]]):with_noremap():with_silent(),
  ['t|<C-k>'] = map_cmd([[<C-\><C-n><C-W>k]]):with_noremap():with_silent(),
  ['t|<C-l>'] = map_cmd([[<C-\><C-n><C-W>l]]):with_noremap():with_silent(),
  ['t|<leader>t'] = map_cmd([[<C-\><C-n>:ToggleTerm<CR>]]):with_noremap():with_silent(),

  -- null-ls
  ['n|<leader>F'] = map_cr('lua vim.lsp.buf.formatting_sync(nil, 2000)')
    :with_noremap()
    :with_silent(),

  -- quickrun
  ['n|<leader>r'] = map_cr("<cmd>lua require'internal.quickrun'.run_command()")
    :with_noremap()
    :with_silent(),
}

bind.nvim_load_mapping(plug_map)
