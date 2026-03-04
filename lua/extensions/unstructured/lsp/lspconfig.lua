return {
  "neovim/nvim-lspconfig",
  lazy = true,
  init = function()
    local lspconf_path = require("lazy.core.config").options.root .. "/nvim-lspconfig"
    vim.opt.runtimepath:prepend(lspconf_path)

    local lsp_all = require('config.lang')

    for i=1, #lsp_all do
      if lsp_all[i].enable then
        vim.lsp.enable(lsp_all[i].lsp_alias)
      end
    end
  end
}
