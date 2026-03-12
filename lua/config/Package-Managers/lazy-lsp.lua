return {
  "dundalek/lazy-lsp.nvim",
  enabled = vim.g.distro_name == "NixOS",
  dependencies = { "neovim/nvim-lspconfig" },
  config = true
}
