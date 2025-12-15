return {
  "nvim-treesitter/nvim-treesitter",

  event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  opts_extend = { "ensure_installed" },

  opts = {
    ensure_installed = require('config.lang')['parserlist'], -- filled in by language-servers.lua
    indent = { enable = true },
    folds = { enable = true },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },
  },
  init = function()
    vim.g.python_indent = {
      closed_paren_align_last_line = true,
      continue = "shiftwidth() * 2",
      disable_parentheses_indenting = true,
      nested_paren = "shiftwidth()",
      open_paren = "shiftwidth() * 2",
      searchpair_timeout = 150
    }
  end,

  build = function()
    pcall(require('nvim-treesitter.install').update({ with_sync = true }))
  end,

  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
}
