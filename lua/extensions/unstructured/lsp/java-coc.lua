return {
  'nvim-java/nvim-java',
  enabled = vim.g.distro_name ~= "NixOS",
  opts = {
    java_debug_adapter = { enable = false }
  }
}
