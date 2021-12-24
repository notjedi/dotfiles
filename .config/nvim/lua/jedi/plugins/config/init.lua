local currentmod = (...)
local M = {}

local function add(modname)
  local modulepath = string.format('%s.%s', currentmod, modname)
  local success, results = pcall(require, modulepath)
  -- modulepath = jedi.plugins.config
  if not success then
    vim.notify('Cannot load' .. modname)
    return
  end

  return results
end

M.setup = function()
  add 'hop'
  add 'gitsigns'
  add 'telescope'
  add 'nvim-tree'
  add 'impatient'
  add 'bufferline'
  add 'treesitter'
  add 'nvim-autopairs'
  add 'nvim-colorizer'
  add 'nvim-web-devicons'

end

return M
