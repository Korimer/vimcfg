return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false, -- neo-tree will lazily load itself
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    opts = {
        auto_clean_after_session_restore = true 
    },
    config = function()
        vim.api.nvim_create_autocmd("VimLeavePre", {
            callback = function() 
                vim.schedule(function() vim.cmd(":Neotree close") end)
            end
        })
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function() 
                vim.schedule(function() vim.cmd("Neotree focus") end)
            end
        })
    end,
  }
}
