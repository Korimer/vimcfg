return {
  "fei6409/log-highlight.nvim",
  opts = {},
  config = function ()
    vim.api.nvim_create_autocmd("BufReadPost", {
      pattern = "*.log",
      callback = function ()
        vim.cmd.syntax('on')
      end
    })
  end
}
