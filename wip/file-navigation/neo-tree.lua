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
      auto_clean_after_session_restore = true,
      --close_if_last_window = true,
      open_files_using_relative_paths = false,
      use_libuv_file_watcher = false,
      window = {
        mappings = {
          ["P"] = {
            "toggle_preview",
            config = {
              use_float = false,
              -- use_image_nvim = true,
              -- use_snacks_image = true,
              -- title = 'Neo-tree Preview',
            },
          },
        }
      }
    },
  }
}
