return {
  "nvim-neo-tree/neo-tree.nvim",
  version = vim.version.range("^3"),
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
    'saifulapm/neotree-file-nesting-config' -- required for vscode like file nesting
  },
  config = function (opts)
    opts.nesting_rules = require('neotree-file-nesting-config').nesting_rules
    require('neo-tree').setup(opts)
  end,
  opts = {
    open_files_using_relative_paths = false,
    use_libuv_file_watcher = true,
    filesystem = {
      group_empty_dirs = true,
      scan_mode = "deep",
    },
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
        --['e'] = function() vim.cmd('Neotree focus filesystem left', true) end,
        --['b'] = function() vim.cmd('Neotree focus buffers left', true) end,
        --['g'] = function() vim.cmd('Neotree focus git_status left', true) end,
      }
    }
  },
}
