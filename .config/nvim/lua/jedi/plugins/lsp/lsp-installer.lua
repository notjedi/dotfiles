local currentmod = (...)
local lsp_installer = require('nvim-lsp-installer')

local function concat(modname)
  return string.format('jedi.plugins.lsp.%s', modname)
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require(concat('handlers')).on_attach,
    capabilities = require(concat('handlers')).capabilities,
  }

  if server.name == 'sumneko_lua' then
    local sumneko_opts = require(concat('settings.sumneko_lua'))
    opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
  end

  if server.name == 'pyright' then
    local pyright_opts = require(concat('settings.pyright'))
    opts = vim.tbl_deep_extend('force', pyright_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
