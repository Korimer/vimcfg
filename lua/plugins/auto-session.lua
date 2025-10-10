return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  end,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    defaults = {
      auto_restore_last_session = false,
      root_dir = vim.fn.stdpath("data") .. "/sessions/"
      
    }
    -- log_level = 'debug',
  }
}
