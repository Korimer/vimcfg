return {
  "dundalek/lazy-lsp.nvim",
  enabled = vim.g.distro_name == "NixOS",
  dependencies = { "neovim/nvim-lspconfig" },
  opts = {
    use_vim_lsp_config = true
  }
}
