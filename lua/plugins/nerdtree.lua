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
    opt = {
        close_if_last_window = true
    },
    config = function()
        vim.api.nvim_create_autocmd("VimLeavePre", {command = ":Neotree close",})
        vim.api.nvim_create_autocmd("VimEnter", {command = "Neotree"})
    end,
  }
}
