local M = {}

M.config = function()
  require("zen-mode").setup {
    window = {
      width = 0.75,
      height = 0.75,
    },
  }
end

return M
