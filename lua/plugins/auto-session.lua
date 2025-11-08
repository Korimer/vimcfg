return {
  "rmagatti/auto-session",
  lazy = false,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/vimsessions", "~/Downloads", "/", ""},
    auto_restore_last_session = true,
    root_dir = '~/vimsessions',
    close_filetypes_on_save = { "checkhealth" },
    auto_delete_empty_sessions = false,
    legacy_cmds = false,
    cwd_change_handling = false,
    pre_save_cmds = { 'Neotree close' },
    post_restore_cmds = { 'Neotree filesystem show' },
  },
}
