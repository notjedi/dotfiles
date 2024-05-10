require("keymap.helpers")
local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd
-- local map_cu = bind.map_cu
-- local map_callback = bind.map_callback

local plug_map = {
	-- Package manager: lazy.nvim
	["n|<leader>ph"] = map_cr("Lazy"):with_silent():with_noremap():with_nowait():with_desc("package: Show"),
	["n|<leader>ps"] = map_cr("Lazy sync"):with_silent():with_noremap():with_nowait():with_desc("package: Sync"),
	["n|<leader>pu"] = map_cr("Lazy update"):with_silent():with_noremap():with_nowait():with_desc("package: Update"),
	["n|<leader>pi"] = map_cr("Lazy install"):with_silent():with_noremap():with_nowait():with_desc("package: Install"),
	["n|<leader>pl"] = map_cr("Lazy log"):with_silent():with_noremap():with_nowait():with_desc("package: Log"),
	["n|<leader>pc"] = map_cr("Lazy check"):with_silent():with_noremap():with_nowait():with_desc("package: Check"),
	["n|<leader>pd"] = map_cr("Lazy debug"):with_silent():with_noremap():with_nowait():with_desc("package: Debug"),
	["n|<leader>pp"] = map_cr("Lazy profile"):with_silent():with_noremap():with_nowait():with_desc("package: Profile"),
	["n|<leader>pr"] = map_cr("Lazy restore"):with_silent():with_noremap():with_nowait():with_desc("package: Restore"),
	["n|<leader>px"] = map_cr("Lazy clean"):with_silent():with_noremap():with_nowait():with_desc("package: Clean"),
}

local custom_mapping = {
	["n|<leader>q"] = map_cr("quit"):with_silent():with_noremap():with_nowait():with_desc("quit nvim"),
	["n|<leader>w"] = map_cr("write"):with_silent():with_noremap():with_nowait():with_desc("write file"),
	["n|cu"] = map_cmd("veU"):with_silent():with_noremap():with_nowait():with_desc("make word uppercase"),
	["n|cl"] = map_cmd("veu"):with_silent():with_noremap():with_nowait():with_desc("make word lowercase"),

	["i|<esc>"] = map_cmd("<esc>`^"):with_noremap(),
	["i|<C-h>"] = map_cmd("<Left>"):with_noremap(),
	["i|<C-l>"] = map_cmd("<Right>"):with_noremap(),
	["i|<C-a>"] = map_cmd("<esc>^i"):with_noremap(),

	["x|p"] = map_cmd('"_dP'):with_noremap(),
}

bind.nvim_load_mapping(plug_map)
bind.nvim_load_mapping(custom_mapping)

-- Plugin keymaps
require("keymap.completion")
require("keymap.editor")
require("keymap.lang")
require("keymap.tool")
require("keymap.ui")

-- User keymaps
local ok, mappings = pcall(require, "user.keymap.init")
if ok then
	require("modules.utils.keymap").replace(mappings)
end
