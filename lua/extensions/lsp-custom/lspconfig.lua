return {
  "neovim/nvim-lspconfig",
  lazy = true,
  init = function()
    local lspconf_path = require("lazy.core.config").options.root .. "/nvim-lspconfig"
    vim.opt.runtimepath:prepend(lspconf_path)
    
    local lsp_sets = require('config.lang')
    local lsp_simple = lsp_sets.lsp_simple
    local lsp_spec = lsp_sets.lsp_spec

    for i=1, #lsp_simple do
      vim.lsp.enable(lsp_simple[i])
    end

    for i=1, #lsp_spec do
      if lsp_spec[i].enable ~= false then
        if lsp_spec[i].alias ~= nil then
          vim.lsp.enable(lsp_spec[i].alias)
        else
          vim.lsp.enable(lsp_spec[i].name)
        end
      end
    end
  end
}
