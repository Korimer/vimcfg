local tsparsers = {
  "c", "cpp", "python", "lua", "rust", "java", "javascript", "ini", "html"
}

return {
  "nvim-treesitter/nvim-treesitter",
  version="*",
  build = ':TSUpdate',
  lazy = false,

  opts = {
    install_dir = vim.fn.stdpath('data') .. '/treesitter',
    prefer_git = true
  },

  config = function (_,opts)
    require('nvim-treesitter').setup(opts)
    require('nvim-treesitter.config').setup({
      highlight = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true }
    })
    require('nvim-treesitter.install').install(tsparsers)
  end

  --event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
  --cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  --opts_extend = { "ensure_installed" },

  --opts = {
  --  ensure_installed = require('config.lang').ts_parsers, -- filled in by language-servers.lua
  --  indent = { enable = true },
  --  folds = { enable = true },
  --  highlight = {
  --    enable = true,
  --    additional_vim_regex_highlighting = false
  --  },
  --},
  --init = function()
  --  vim.g.python_indent = {
  --    closed_paren_align_last_line = true,
  --    continue = "shiftwidth() * 2",
  --    disable_parentheses_indenting = true,
  --    nested_paren = "shiftwidth()",
  --    open_paren = "shiftwidth() * 2",
  --    searchpair_timeout = 150
  --  }
  --end,
}
