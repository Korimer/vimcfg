local targets = require('plugins.LanguageServers.to-install')
local treesitter = require('plugins.LanguageServers.treesitter')
local completion = require('plugins.LanguageServers.nvim-cmp')
vim.print(treesitter["opts"])
return {}
