return {
--  {
--    "nvim-tree/nvim-web-devicons",
--    lazy = false
--  },
--  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    opts = {},
    lazy = false,

    init = function()
        vim.api.nvim_create_autocmd("VimLeavePre", {
            callback = function() 
                vim.schedule(function() vim.cmd("NvimTreeClose") end)
            end
        })
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function() 
                vim.schedule(function() vim.cmd("NvimTreeFocus") end)
            end
        })
    end
--  }
}
