local tsparsers = {
  "c", "cpp", "python", "lua", "rust", "java", "javascript", "ini", "html"
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
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
    if vim.g.distro_name ~= "NixOS" then
      require('nvim-treesitter').install(tsparsers, {max_jobs=1})
    end
    vim.api.nvim_create_autocmd("BufReadPost", {
      pattern = "*",
      callback = function()
        if vim.treesitter.get_parser(0,nil,{error=false}) ~= nil then
          vim.cmd.syntax("off")
          vim.treesitter.start()
        else
          vim.cmd.syntax("on")
        end
      end,
    })
  end
}
