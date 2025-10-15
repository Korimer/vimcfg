return {
    "rmagatti/auto-session",
    lazy = false,
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        suppressed_dirs = { "~/", "~/vimsessions", "~/Downloads", "/", ""},
        auto_restore_last_session = true,
        root_dir = '~/vimsessions'
    }
}
