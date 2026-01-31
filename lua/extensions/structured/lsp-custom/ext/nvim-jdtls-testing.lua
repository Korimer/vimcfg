return {
  enabled=false,
  'mfussenegger/nvim-jdtls',
  dependencies = { "neovim/nvim-lspconfig" },
  config = function ()
  vim.api.nvim_create_autocmd("FileType", {})
  vim.api.nvim_create_autocmd("LspAttach", {})
  end
}
