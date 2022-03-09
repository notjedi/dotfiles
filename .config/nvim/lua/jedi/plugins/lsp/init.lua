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
  add('cmp')
  add('lsp-installer')
  add('handlers').setup()
  vim.notify('LSP support added.')
end

return M
