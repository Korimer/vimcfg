local tsparsers = {
  "c", "cpp", "python", "lua", "rust", "java", "javascript", "ini", "html"
}

local noindent_filetypes = {
  "python"
}

local noindent = {}
for i=1, #noindent_filetypes do
  noindent[noindent_filetypes[i]] = true
end

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ':TSUpdate',
  lazy = false,
  enable = false,
  cond = false,

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
    require('nvim-treesitter').install(tsparsers)
    vim.api.nvim_create_autocmd("BufReadPost", {
      pattern = "*",
      callback = function()
        -- If there exists a parser for this file, try to use it to the most
        local parser = vim.treesitter.get_parser(0,nil,{error=false})

        if parser ~= nil then
          vim.cmd.syntax("off")
          vim.treesitter.start()
          if not noindent[vim.bo.filetype] then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        else
          vim.cmd.syntax("on")
        end
      end,
    })
  end
}
