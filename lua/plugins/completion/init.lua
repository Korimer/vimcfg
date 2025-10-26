local cmp = require('plugins.completion.nvim-cmp')
local mason = require('plugins.completion.mason')
local snip = require('plugins.completion.luasnip')

local targets = require('config.lang')
local parsers = targets["parserlist"]
local lsps = targets["lsplist"]

local treesitter = require('plugins.completion.treesitter')
treesitter["opts"]["ensure_installed"] = parsers 
local mason_lsp = require('plugins.completion.mason-lspconfig')

return({
    cmp,
    snip,
    mason,
    mason_lsp,
    treesitter,
})
