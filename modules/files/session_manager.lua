return {
  "Shatur/neovim-session-manager",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    require('session_manager').setup({
      autoload_mode = require('session_manager.config').AutoloadMode.Disabled
    })

  local session_group = vim.api.nvim_create_augroup('SessionManagerHooks', { clear = true })
  vim.api.nvim_create_autocmd('User', {
    pattern = "SessionLoadPost",
    group = session_group,
    callback = function()
      vim.cmd("Neotree show")
    end,
    })
  end
}
