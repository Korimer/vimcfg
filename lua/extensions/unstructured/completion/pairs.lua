return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function ()
      local ap = require('nvim-autopairs')
      ap.setup({})
      local aprules = ap.config.rules
      for i=1, #aprules do
        aprules[i].key_map = nil
      end
    end
  },
  {
    'steelsojka/pears.nvim',
    dependencies = {"windwp/nvim-autopairs"},
    opts = function(conf)
      vim.print(conf)
      conf.expand_on_enter(false)
    end,
    config = function(_,opts)
      require("pears").setup(opts)
      vim.api.nvim_set_keymap(
        'i',
        '<CR>',
        "v:lua.require'nvim-autopairs'.completion_confirm()",
        { expr = true, noremap = true, desc = "autopairs completion confirm" }
      )
    end
  }
}
