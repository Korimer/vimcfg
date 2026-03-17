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
    },
    cmdline = {
      enabled = true,
      keymap = {
        preset = 'cmdline',

        ['<Tab>'] = { function (cmp)
          if cmp.is_menu_visible() then
            cmp.accept()
          else
            cmp.show_and_insert_or_accept_single()
          end
        end },
      },



      completion = { menu = { auto_show = false } },
    },

    completion = {
      documentation = { auto_show = false },
      ghost_text = {
        enabled = true,
        show_with_menu = true
      },
      menu = {
        enabled = true,
        auto_show = false,
        draw = { treesitter = { "lsp" } }
      },
      --list = { selection = { preselect = false }, cycle = { from_top = false } },
    },

    -- See https://cmp.saghen.dev/configuration/reference#sources
    -- And https://cmp.saghen.dev/configuration/sources#provider-options
    sources = {
      default = {'lsp', 'path', 'snippets', 'buffer' },
    },
    snippets = { preset = 'luasnip' },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = { "exact", "score", "sort_text" }
    }
  },
  opts_extend = { "sources.default" }
}
