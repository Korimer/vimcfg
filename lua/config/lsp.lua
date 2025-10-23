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
  java = {"jdtls"}, --,"java-test","java-debug-adapter"},
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

local lsppath = vim.fn.stdpath("config") .. "/lua/config/lsp"

for _, file in ipairs(lspset) do
  local lsp_setup = require('config.lsp.' .. file:gsub("%.lua$",""))
  local lsp_name = lsp_setup[1]
  local lsp_cfg = lsp_setup[2]
  vim.lsp.config[lsp_name] = lsp_cfg
  vim.lsp.enable(lsp_name)
end

return {
  ["parserlist"] = parserlist,
  ["lsplist"] = lsplist
}
