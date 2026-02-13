-- as opposed to .182
return {
  "saghen/blink.cmp",
  dependencies = { "L3MON4D3/LuaSnip" },
  -- apparently release tag = download prebuilt?
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'super-tab',
      --['<Tab>'] = {
      --  function(cmp)
      --    vim.print("blink proc lol")
      --    if false then
      --      return cmp.insert_next()
      --    end
      --  end,
      --  'fallback',
      --},
      --['<S-Tab>'] = { 'insert_prev' },
    },

    completion = {
      documentation = { auto_show = false },
      ghost_text = {
        enabled = true,
        show_with_menu = true
      },
      menu = {
        enabled = true,
        auto_show = false
      },
      --list = { selection = { preselect = false }, cycle = { from_top = false } },
    },

    -- See https://cmp.saghen.dev/configuration/reference#sources
    -- And https://cmp.saghen.dev/configuration/sources#provider-options
    sources = {
      default = { 'path', 'snippets', 'buffer' },
      providers = {
        lsp = {
          name = 'LSP',
          module = 'blink.sources.lsp',
          enabled = true,
          async = false,
          timeout = 2000,
          min_keyword_length = 0,
          fallbacks = { 'buffer' },
          score_offset = 2 -- money
        }
      }
    },
    snippets = { preset = 'luasnip' },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = { "exact", "score", "sort_text" }
    }
  },
  opts_extend = { "sources.default" }
}
