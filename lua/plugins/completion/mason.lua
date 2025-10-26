return {
    "mason-org/mason.nvim",
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
          'file:' .. vim.fn.stdpath('config') .. '\\lua\\config\\Mason-Custom'
        }
    },
    init = function()
      local mreg = require('mason-registry') -- do NOT typo a 'p' here
      mreg.refresh(function() 
        for _, lsp in ipairs(require('config.lang')['lsplist']) do
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
