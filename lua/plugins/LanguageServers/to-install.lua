local target_langs = {
  c = nil,
  diff = nil,
  lua = nil,
  luadoc = nil,
  markdown = nil,
  markdown_inline = nil,
  printf = nil,
  regex = nil,
  vim = nil,
  vimdoc = nil,
  java = nil
}

local i = 1
local j = 1
local parserlist = {}
local lsplist = {}
for k, v in pairs(target_langs) do
  parserlist[i] = k
  i = i+1
  if v ~= nil then
    lsplist[j] = v
    j = j+1
  end
end

return {
  ["parserlist"] = parserlist,
  ["lsplist"] = lsplist
}
