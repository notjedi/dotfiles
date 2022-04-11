local currentmod = (...)
local M = {}

local function add(modname)
  local modulepath = string.format('%s.%s', currentmod, modname)
  local success, results = pcall(require, modulepath)
  if not success then
    vim.notify('Cannot load ' .. modname)
    return
  end

  return results
end

M.setup = function()
  add('hop')
  add('lualine')
  add('comment')
  add('null-ls')
  add('gitsigns')
  add('telescope')
  add('nvim-tree')
  add('impatient')
  add('toggleterm')
  add('bufferline')
  add('treesitter')
  add('nvim-autopairs')
  add('nvim-colorizer')
  add('nvim-web-devicons')
end

return M
