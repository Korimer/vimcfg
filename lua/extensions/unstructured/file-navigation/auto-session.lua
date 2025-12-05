return {
  "rmagatti/auto-session",
  lazy = false,
  opts = {
    suppressed_dirs = { "~/", "~/vimsessions", "~/Downloads", "/", ""},
    auto_restore_last_session = true,
    root_dir = '~/vimsessions',
    close_filetypes_on_save = { "checkhealth" },
    auto_delete_empty_sessions = false,
    legacy_cmds = false,
    cwd_change_handling = false,
    pre_save_cmds = { 'Neotree close' },
    post_restore_cmds = { function()
        local buffset = vim.api.nvim_list_bufs()
        for i=1, #buffset do
          local buf_name = vim.api.nvim_buf_get_name(buffset[i])
          if string.find(buf_name,"neo-tree fillesystem [1]") then
            vim.api.nvim_buf_delete(buffset[i],{force=true})
          end
        end
        vim.cmd("Neotree filesystem show")
      end
    },
  },
}
