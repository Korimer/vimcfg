return {
    'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6', --recommended as each new version will have breaking changes
    cond = false,
    opts = {},
    config = function (_, opts)
      require('ultimate-autopair').setup(opts)
      local getrun = require('ultimate-autopair.core').get_run("\r")
      --nvim.keymap.set('i','<CR>',getrun,{noremap=true,expr=true,replace_keycodes=false})
      vim.keymap.set('i','<CR>',function ()
        local _, col = unpack(vim.api.nvim_win_get_cursor(0))
        local lchar = vim.api.nvim_get_current_line():sub(col,col+1)
        vim.print(lchar)
        if lchar == "><" then
          return vim.api.nvim_replace_termcodes('<CR><c-O>O',true,true,true)
        else
          return vim.api.nvim_eval(getrun)
        end
      end, {noremap=true,expr=true,replace_keycodes=false})
    end
}
