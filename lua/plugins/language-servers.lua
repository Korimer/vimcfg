local cmp = require('plugins.LanguageServers.nvim-cmp')
local cmp_lsp = require('plugins.LanguageServers.cmp-nvim-lsp')
local mason = require('plugins.LanguageServers.mason')

local targets = require('plugins.LanguageServers.to-install')

local treesitter = require('plugins.LanguageServers.treesitter')
treesitter["opts"]["ensure_installed"] = targets["parserlist"]

local mason_lsp = require('plugins.LanguageServers.mason-lspconfig')
mason_lsp["opts"]["ensure_installed"] = targets["lsplist"]

return {
    cmp,
    mason,
    cmp_lsp,
    mason_lsp,
    treesitter,
}
