return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  opts = {
    open_files_using_relative_paths = false,
    use_libuv_file_watcher = vim.g.env == "LINUX",
    window = {
      mappings = {
        ["P"] = {
          "toggle_preview",
          config = {
            use_float = true,
            -- use_image_nvim = true,
            -- use_snacks_image = true,
            -- title = 'Neo-tree Preview',
          },
        },
      }
    }
  },
}
