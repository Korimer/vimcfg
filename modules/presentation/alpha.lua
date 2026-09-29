local configFileLocation = "./_alphasetup.lua"

return {
  src = 'goolord/alpha-nvim',
  dependencies = {
    'nvim-mini/mini.icons',
    'nvim-lua/plenary.nvim'
  },
  config = function ()
    local mypath = debug.getinfo(1, "S").source:sub(2)
    local mydir = vim.fn.fnamemodify(mypath,":h")
    local configFile = vim.fs.joinpath(mydir, configFileLocation)
    local config = dofile(configFile).config
    require'alpha'.setup(config)
  end
}
