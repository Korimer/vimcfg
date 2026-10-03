return {
  src = 'goolord/alpha-nvim',
  dependencies = {
    'nvim-mini/mini.icons',
    'nvim-lua/plenary.nvim'
  },
  config = function ()
    local configFile = vim.my.fn.fromscriptroot("./resources/_alphasetup.lua")

    local config = dofile(configFile).config
    require'alpha'.setup(config)
  end
}
