return {
  "hrsh7th/nvim-cmp",
  event = {"InsertEnter", "VeryLazy"},
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- "ray-x/cmp-treesitter", -- uncomment if using treesitter completion
  },
  
  opts = function() return {
    snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
    mapping = {},
    sources = require('cmp').config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
    })
  } end,
}
