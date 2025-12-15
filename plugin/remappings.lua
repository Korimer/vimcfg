vim.api.nvim_create_user_command("KillShada",function ()
  local shada_root = vim.fn.stdpath('data') .."/shada"
  local shadafiles = vim.fn.readdir(shada_root)
  for i=1, #shadafiles do
    os.remove(shada_root .. '/' .. shadafiles[i] )
  end
end, {})

vim.keymap.set('n','<F3>',':nohlsearch<CR>',{noremap=true; silent=true})
vim.keymap.set('n','gd',vim.lsp.buf.definition,{noremap=true; silent=true})
--vim.keymap.set('i',"<CR>",
--  function()
--    vim.notify("hi")
--    return "<CR><C-o>O"
--  end
--  ,{noremap=true; silent=true, expr=true}
--)
