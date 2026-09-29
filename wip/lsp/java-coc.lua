vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.jj",
  callback = function()
    vim.bo.filetype = "java"
  end,
})

return {
  'nvim-java/nvim-java',
  enabled = vim.g.distro_name ~= "NixOS",
  opts = {
    java_debug_adapter = { enable = false }
  }
}
