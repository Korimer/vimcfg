
vim.keymap.set({"n","v","i"},"<F6>",function ()
  vim.print(vim.lsp.buf.hover())
end, {noremap=true, silent=true})

vim.keymap.set({"n","v","i"},"<F5>",function ()
  vim.print("hi hello im here")
  vim.print(vim.lsp.completion.get())
end, {noremap=true, silent=true})

vim.keymap.set({"n","v","i"},"<F4>",function ()
  vim.print(require('cmp').get_entries())
end, {noremap=true, silent=true})

return {
  "hrsh7th/nvim-cmp",
  event = {"InsertEnter", "VeryLazy"},
  dependencies = {
    -- core
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- idk yet lol
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    -- extensions
    "jmbuhr/otter.nvim"
  },
  opts = function()
    local cmp = require('cmp')
    return {
      -- Trying to get this manually done instead
      experimental = { ghost_text = false },
      snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
      sources = cmp.config.sources({
        { name = "async_path" },
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
