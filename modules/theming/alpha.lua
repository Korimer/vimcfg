local asciilogo = {
[[   \  |  ____| \ \     / ____|   _ \       _ \   \  |   ___|  ____|             ]],
[[    \ |  __|    \ \   /  __|    |   |     |   |   \ |  |      __|               ]],
[[  |\  |  |       \ \ /   |      __ <      |   | |\  |  |      |                 ]],
[[ _| \|| _|__||  | \\/ | ____\| _| \\\ |  \___/ \| \_| \__|_| __\__| _ _|   \  | ]],
[[     |   |  |   | |\/ |    _ \      \ |       _ \    |        _ \     |     \ | ]],
[[     ___ |  |   | |   |   ___ \   |\  |      ___ \   |   |   ___ \    |   |\  | ]],
[[    _|  _| \___/ _|  _| _/    _\ _| \_|    _/    _\ \____| _/    _\ ___| _| \_| ]],
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
