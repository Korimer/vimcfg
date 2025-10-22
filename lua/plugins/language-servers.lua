local cmp = require('plugins.LanguageServers.nvim-cmp')
local mason = require('plugins.LanguageServers.mason')
local snip = require('plugins.LanguageServers.luasnip')

local targets = require('plugins.LanguageServers.to-install')

local treesitter = require('plugins.LanguageServers.treesitter')
treesitter["opts"]["ensure_installed"] = targets["parserlist"]

local mason_lsp = require('plugins.LanguageServers.mason-lspconfig')
mason_lsp["opts"]["ensure_installed"] = targets["lsplist"]

return {
    cmp,
    snip,
    mason,
    mason_lsp,
    treesitter,
}
