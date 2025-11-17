return {
  "mason-org/mason.nvim",
  enabled = vim.g.distro_name ~= "NixOS",
  opts = {
    ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
    },
    registries = {
      'github:mason-org/mason-registry',
      'file:' .. vim.fn.stdpath('config') .. '/lua/config/Mason-Custom'
    }
  },
  init = function()
    local mreg = require('mason-registry') -- do NOT typo a 'p' here
    mreg.refresh(function()
      local needs_install = require('config.lang').lsp_all
      for i=1, #needs_install do
        local lsp = needs_install[i]
        if mreg.has_package(lsp) then
          if not mreg.is_installed(lsp) then
            vim.cmd('MasonInstall ' .. lsp)
          end
        else
          vim.notify('ERROR in mason init: lsp \'' ..lsp .. '\' is not available in any registry.')
        end
      end
    end)
  end
}
