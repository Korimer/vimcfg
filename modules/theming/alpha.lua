local asciilogo = {
[[   \  |  ____| \ \     / ____|   _ \  |  |   |  |   |  \  |     \      \  | ]],
[[    \ |  __|    \ \   /  __|    |   | |  |   |  |   | |\/ |    _ \      \ | ]],
[[  |\  |  |       \ \ /   |      __ <  |  ___ |  |   | |   |   ___ \   |\  | ]],
[[ _| \_| _____|\   \_/|  ____|| _|_\|\ | _|  \| \___/__|  _| \/   __\|_| \_||]],
[[           |   |   \ |  |      __|   _|    _ \    |        _ \     |     \ |]],
[[           |   | |\  |  |      |   _   _| ___ \   |   |   ___ \    |   |\  |]],
[[          \___/ _| \_| \____| _____| _| _/    _\ \____| _/    _\ ___| _| \_|]],
}

return {
  src = 'goolord/alpha-nvim',
  dependencies = {
    'nvim-mini/mini.icons',
    'nvim-lua/plenary.nvim'
  },
  config = function ()
    local baseconf = require'alpha.themes.theta'.config
    local blayout = baseconf.layout
    blayout[2] = {
      opts = { hl="Type", position="center" },
      type = "text",
      val = asciilogo
    }
    require'alpha'.setup(baseconf)
    --require'alpha.term'
  end
}
