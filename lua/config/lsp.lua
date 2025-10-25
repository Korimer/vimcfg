local target_langs = {
  c = {"clangd"},
  cpp = {"clangd"}, 
  diff = {},
  lua = {"lua_ls"},
  luadoc = {},
  markdown = {},
  markdown_inline = {},
  printf = {},
  regex = {},
  vim = {},
  vimdoc = {},
  java = {"_java"}, --,"java-test","java-debug-adapter"}, -- Actually using nvim-java for this!
  rust = {"rust_analyzer"}
}

local i = 1
local parserlist = {}
local lspset = {}
for k, v in pairs(target_langs) do
  parserlist[i] = k
  i = i+1
  for _, dep in ipairs(v) do
    lspset[dep] = true
  end
end

local j = 1
local lsplist = {}
for k, v in pairs(lspset) do
    lsplist[j] = k
    j = j+1
end

local lsppath = vim.fn.stdpath("config") .. "/lua/config/lsp/configurations"

for _, lsp in ipairs(lsplist) do
  local f = io.open(lsppath .. '/' .. lsp .. '.lua')
  if (f ~= nil) then
    io.close(f)
    local lsp_setup = require('config.lsp.configurations.' .. lsp)
    local lsp_cfg = lsp_setup
    vim.lsp.config[lsp] = lsp_cfg
  end
  vim.lsp.enable(lsp)
end

return {
  ["parserlist"] = parserlist,
  ["lsplist"] = lsplist
}
