local currentmod = (...)
local M = {}

local function add(modname)
  local modulepath = string.format('%s.%s', currentmod, modname)
  local success, results = pcall(require, modulepath)
  if not success then
    vim.notify('Cannot load' .. modname)
    return
  end

  return results
end

M.setup = function()
  add 'hop'
  add 'gitsigns'
  add 'nvim-tree'
  add 'todo-comments'
  add 'nvim-autopairs'
  add 'nvim-colorizer'
  add 'nvim-web-devicons'

end

return M
