local target_langs = {
  c = {"clangd"},
  cpp = {"clangd"}, 
  diff = {},
  lua = {},
  luadoc = {},
  markdown = {},
  markdown_inline = {},
  printf = {},
  regex = {},
  vim = {},
  vimdoc = {},
  java = {"java-language-server"}, --,"java-test","java-debug-adapter"},
  rust = {"rust-analyzer"}
}

local i = 1
local j = 1
local parserlist = {}
local lsplist = {}
for k, v in pairs(target_langs) do
  parserlist[i] = k
  i = i+1
  for _, dep in ipairs(v) do
    lsplist[j] = dep
    j = j+1
  end
end

return {
  ["parserlist"] = parserlist,
  ["lsplist"] = lsplist
}
