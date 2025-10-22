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
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('lspconfig').setup {
    capabilities = capabilities
  }
    cmp.setup({
      sources = cmp.config.sources({
        {name = 'treesitter'},
        {name = 'nvim_lsp'},
        {name = 'luasnip'}
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({
        -- Navigate between completion items
        ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
      })
    })  
  end
}
