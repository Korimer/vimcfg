local target_langs = {
  c = {"clangd"},
  cpp = {"clangd"}, 
  diff = {},
  lua = {"lua-language-server"},
  luadoc = {},
  markdown = {},
  markdown_inline = {},
  printf = {},
  regex = {},
  vim = {},
  vimdoc = {},
  java = {'jdtls','openjdk-25','openjdk-17'}, --,"java-test","java-debug-adapter"} 
  rust = {"rust-analyzer"}
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

return {
  ["parserlist"] = parserlist,
  ["lsplist"] = lsplist
}
