local cmp_lsp = require('plugins.LanguageServers.cmp-nvim-lsp')
local cmp = require('plugins.LanguageServers.nvim-cmp')

local targets = require('plugins.LanguageServers.to-install')

local treesitter = require('plugins.LanguageServers.treesitter')
treesitter["opts"]["ensure_installed"] = targets["parserlist"]

local mason = require('plugins.LanguageServers.nvim-cmp')
mason["opts"]["ensure_installed"] = targets["lsplist"]
return {}
