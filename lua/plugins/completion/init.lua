local cmp = require('plugins.completion.nvim-cmp')
local mason = require('plugins.completion.mason')
local snip = require('plugins.completion.luasnip')

local targets = require('plugins.completion.to-install')
local parsers = targets["parserlist"]
local lsps = targets["lsplist"]

local treesitter = require('plugins.completion.treesitter')
treesitter["opts"]["ensure_installed"] = parsers 
local mason_lsp = require('plugins.completion.mason-lspconfig')
mason_lsp["opts"]["ensure_installed"] = lsps


--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
--local lspconfig = require 'lspconfig'
--for _, lsp in ipairs(lsps) do
--  lspconfig[lsp].setup {
--    capabilities = capabilities,
--  }
--end
--
-------------------
---
--local cmp = require 'cmp'
--local luasnip = require 'luasnip'
--
--luasnip.config.setup {}
--
--cmp.setup {
--  snippet = {
--    expand = function(args)
--      luasnip.lsp_expand(args.body)
--    end,
--  },
--  mapping = cmp.mapping.preset.insert {
--    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-f>'] = cmp.mapping.scroll_docs(4),
--    ['<C-Space>'] = cmp.mapping.complete {},
--    ['<CR>'] = cmp.mapping.confirm {
--      behavior = cmp.ConfirmBehavior.Replace,
--      select = true,
--    },
--    ['<Tab>'] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      elseif luasnip.expand_or_jumpable() then
--        luasnip.expand_or_jump()
--      else
--        fallback()
--      end
--    end, { 'i', 's' }),
--    ['<S-Tab>'] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif luasnip.jumpable(-1) then
--        luasnip.jump(-1)
--      else
--        fallback()
--      end
--    end, { 'i', 's' }),
--  },
--  sources = {
--    { name = 'nvim_lsp' },
--    { name = 'luasnip' },
--  },
--}

return({
    cmp,
    snip,
    mason,
    mason_lsp,
    treesitter,
})
