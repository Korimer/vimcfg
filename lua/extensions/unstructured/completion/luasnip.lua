local friendly_extends = {
  typescript = { 'tsdoc' },
  javascript = { 'jsdoc' },
  lua = { 'luadoc' },
  python = { 'pydoc' },
  rust = { 'rustdoc' },
  java = { 'javadoc' },
  c = { 'cdoc' },
  cpp = { 'cppdoc' },
  php = { 'phpdoc' },
  sh = { 'shelldoc' },
}

return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    dependencies = {
      "rafamadriz/friendly-snippets"
    },
    -- lmao imagine using js
    --run = "make install_jsregexp"
    opts = { history = true, delete_check_events = 'TextChanged' },

    config = function(_,opts)
      local snip = require('luasnip')
      snip.setup(opts)
      require('luasnip.loaders.from_vscode').lazy_load()
      for ft, snips in pairs(friendly_extends) do
        require('luasnip').filetype_extend(ft, snips)
      end

      vim.keymap.set({"i","n"},"<C-Tab>",function ()
        snip.jump(1)
      end,{noremap=true, silent=true})
      vim.keymap.set({"i","n"},"<C-S-Tab>",function ()
        snip.jump(-1)
      end,{noremap=true, silent=true})
    end,
}
