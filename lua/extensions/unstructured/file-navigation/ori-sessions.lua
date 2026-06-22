return {
  -- "Korimer/ori-sessions"
  dir = "/home/korimer/Documents/cs/ori-sessions/"
  ;opts = {
    restore_prev_session = true
    ;workspace_enable_hook = function() vim.cmd("Neotree filesystem show") end
  }
}
