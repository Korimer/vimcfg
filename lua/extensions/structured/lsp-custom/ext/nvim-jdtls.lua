local sep = vim.g.path_sep
local mason_dir = vim.fn.stdpath('data') .. sep .. "mason" .. sep .. "packages" .. sep .."bin"

return {
  "mfussenegger/nvim-jdtls",

  config = function ()
    vim.lsp.config('jdtls', {
      cmd = function (dispatchers, client_config)
         vim.lsp.rpc.start(
           {'jdtls', "--java-executable", mason_dir .. "java.cmd"},
           dispatchers,
           {
             cwd = client_config.cmd_cwd,
             env = client_config.cmd_env,
             detached = client_config.detached
           }
         )
      end
    })
  end
}
