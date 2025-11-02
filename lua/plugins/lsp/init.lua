local lsp_list = require('config.lang')["lsplist"]
local lsp_path = vim.fn.stdpath('config') .. '\\lua\\plugins\\lsp'

for _, lsp in ipairs(lsp_list) do
  local f = io.open(lsp_path .. '\\builtin\\' .. lsp .. '.lua')
  if (f ~= nil) then
    io.close(f)
    local pre_config = require('plugins.lsp.builtin.' .. lsp)
    if next(pre_config) ~= nil then
      vim.lsp.config(lsp,pre_config)
      vim.lsp.enable(lsp)
    end
  else
    vim.print('enabling ' .. lsp)
    vim.lsp.enable(lsp)
  end
end

local full_spec = {}
local external_lsp_repos = vim.fn.readdir(lsp_path .. '\\ext')
for i, spec in ipairs(external_lsp_repos) do
  full_spec[i] = require('plugins.lsp.ext.' .. spec:gsub("%.lua",""))
end

return full_spec
