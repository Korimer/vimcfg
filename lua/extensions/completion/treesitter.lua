return {
  "nvim-treesitter/nvim-treesitter",
  
  event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  opts_extend = { "ensure_installed" },

  opts = {
    ensure_installed = require('config.lang')['parserlist'], -- filled in by language-servers.lua
    indent = { enable = true }, ---@type lazyvim.TSFeat
    folds = { enable = true }, ---@type lazyvim.TSFeat
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    }, ---@type lazyvim.TSFeat
  }
}
