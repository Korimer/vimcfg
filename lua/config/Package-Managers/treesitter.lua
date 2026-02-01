local tsparsers = {
  "c", "cpp", "python", "lua", "rust", "java", "javascript", "ini", "html"
}

return {
  "nvim-treesitter/nvim-treesitter",
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
}
