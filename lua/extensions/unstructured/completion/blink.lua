-- as opposed to .182

return {
  'saghen/blink.cmp',
  -- add luasnip..?
  dependencies = {  },
  -- apparently release tag = download prebuilt?
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'none',
    
      ['<Tab>'] = {
        function(cmp)
          if has_words_before() then
            return cmp.insert_next()
          end
        end,
        'fallback',
      },
      ['<S-Tab>'] = { 'insert_prev' },
    },
    completion = {
      menu = { enabled = false },
      list = { selection = { preselect = false }, cycle = { from_top = false } },
    },
  }
}
