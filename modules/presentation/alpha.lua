local configFileLocation = "./_alphasetup.lua"

return {
  src = 'goolord/alpha-nvim',
  dependencies = {
    'nvim-mini/mini.icons',
    'nvim-lua/plenary.nvim'
  },
  config = function ()
    local configFile = vim.my.fn.fromscriptroot(configFileLocation)

    local config = dofile(configFile).config
    require'alpha'.setup(config)
  end
}
