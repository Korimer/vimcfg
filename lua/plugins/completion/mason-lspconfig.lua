return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = require('config.lang')['lsplist']
    },
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
}
