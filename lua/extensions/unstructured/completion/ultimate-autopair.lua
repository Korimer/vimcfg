return {
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    dependencies = { 'windwp/nvim-autopairs' },
    branch='v0.6', --recommended as each new version will have breaking changes
    cond = true,

    opts={},

    config = function(_,opts)
      require('ultimate-autopair').setup(opts)
      --for _, i in ipairs(require("nvim-autopairs").config.rules) do
      --  i.key_map = nil
      --end
      vim.api.nvim_set_keymap(
        'i',
        '<CR>',
        "v:lua.require'nvim-autopairs'.completion_confirm()",
        { expr = true, noremap = true, desc = "autopairs completion confirm" }
      )
    end
}
