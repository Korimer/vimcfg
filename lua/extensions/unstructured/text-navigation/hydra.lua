function SimpleHeads(leader,heads)
  local out = {}
  for i=1, #heads do out[i] = {heads[i],leader..heads[i]} end
  return out
end

local hydra_default = {
  debug = false,
  exit = false,
  foreign_keys = nil,
  color = "red",
  timeout = false,
  invoke_on_body = true,
  hint = {
      show_name = true,
      hide_on_load=false,
  },
  on_enter = nil,
  on_exit = nil,
  on_key = nil,
}

local cw_hydra = {
  name = "Window Manager",
  mode = "n",
  body = "<Leader>w",
  heads = SimpleHeads("<C-w>",{
    "b","c","d","f",
    "g","h","i","j",
    "k","l","n","o",
    "p","q","r","s",
    "t","v","w","x",
    "z","]","^","_",
  })
}

return {
  "nvimtools/hydra.nvim",
  config = function()
    local Hydra = require("hydra")
    Hydra.setup(hydra_default)
    Hydra(cw_hydra)
  end
}
