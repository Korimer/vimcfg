return {
  {
    'windwp/nvim-autopairs',
    cond=true
  },
  {
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6', --recommended as each new version will have breaking changes
    config = function ()
      --require('ultimate-autopair').setup({})
      local ap = require('nvim-autopairs')
      ap.setup({})
      --local aprules = ap.config.rules
      --for i=1, #aprules do aprules[i].key_map = nil end
      --vim.api.nvim_set_keymap(
      --  'i',
      --  '<CR>',
      --  "v:lua.require'nvim-autopairs'.completion_confirm()",
      --  { expr = true, noremap = true, desc = "autopairs completion confirm" }
      --)
    end,
    cond = true
  }
}
