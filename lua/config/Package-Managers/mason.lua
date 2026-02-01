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
    local mapi = require('mason.api.command')
    mreg.refresh(function()
      local all_installs = require('config.lang')
      for i=1, #all_installs do
        local lsp = all_installs[i]
        if mreg.has_package(lsp.name) then
          if not mreg.is_installed(lsp.name) then
            mapi.MasonInstall({lsp.name})
          end
        else
          error("Error: Package " .. lsp.name .. " does not exist in the Mason registry!")
        end
      end
    end)
  end
}
