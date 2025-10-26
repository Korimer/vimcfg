local lsp_list = require('config.lang')["lsplist"]
local lsp_path = vim.fn.stdpath('config') .. '\\lua\\plugins\\lsp'

for _, lsp in ipairs(lsp_list) do
  local f = io.open(lsp_path .. '\\builtin\\' .. lsp .. '.lua')
  if (f ~= nil) then
    io.close(f)
    vim.lsp.config(lsp, require('plugins.lsp.builtin.' .. lsp))
  end
  vim.lsp.enable(lsp)
end

local full_spec = {}
local external_lsp_repos = vim.fn.readdir(lsp_path .. '\\ext')
for i, spec in ipairs(external_lsp_repos) do
  full_spec[i] = require('plugins.lsp.ext.' .. spec:gsub("%.lua",""))
end

return full_spec
