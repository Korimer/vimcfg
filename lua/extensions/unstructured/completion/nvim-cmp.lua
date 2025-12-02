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

  opts = function()
    local cmp = require('cmp')
    return {
      experimental = { ghost_text = true },
      snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }),

      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
    }
  end,

  init = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    vim.lsp.config('*',{capabilities = capabilities})
  end,
}
