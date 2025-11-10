vim.api.nvim_create_user_command("KillShada",function ()
  local shada_root = vim.fn.stdpath('data') .."/shada"
  local shadafiles = vim.fn.readdir(shada_root)
  for i=1, #shadafiles do
    os.remove(shada_root .. '/' .. shadafiles[i] )
  end
end, {})
