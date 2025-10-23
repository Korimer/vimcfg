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
  
  init = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    for _, v in ipairs(require('plugins.completion.to-install')['lsplist']) do
      vim.lsp.enable(v)
      require('config.lsp.global')
      vim.print(vim.lsp.config[v])--[capabilities] = capabilities
      vim.print(vim.lsp.config[v])
    end
  end
}
