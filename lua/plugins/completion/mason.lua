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
      require('mason-registry').refresh()
    end
}
