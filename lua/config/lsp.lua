--local capabilities = require('cmp_nvim_lsp').default_capabilities()
--for _, v in ipairs(require('plugins.completion.to-install')['lsplist']) do
--  vim.lsp.enable(v)
--  require('config.lsp.global')
--  vim.print(vim.lsp.config[v])--[capabilities] = capabilities
--  vim.print(vim.lsp.config[v])
--end

local lsppath = vim.fn.stdpath("config") .. "/lua/config/lsp"

for _, file in ipairs(vim.fn.readdir(lsppath)) do
  local lsp_setup = vim.print(require('config.lsp.' .. file:gsub("%.lua$","")))
  local lsp_name = lsp_setup[1]
  local lsp_cfg = lsp_setup[2]
  vim.lsp.config[lsp_name] = lsp_cfg
  vim.lsp.enable(lsp_name)
end
