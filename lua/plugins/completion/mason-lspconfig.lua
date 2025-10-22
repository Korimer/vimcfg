return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {} -- filled in by language-servers.lua
    },
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
}
