local getPluginNames = function ()
  local pluginNames = {}
  local allPlugins = vim.pack.get()
  for i=1, #allPlugins do
    pluginNames[#pluginNames+1] = allPlugins[i].spec.name
  end
  return pluginNames
end

vim.api.nvim_create_user_command("PluginUninstallAll", function()
  vim.pack.del(getPluginNames())
end, {})

vim.api.nvim_create_user_command("PluginListAll", function()
  local names = getPluginNames()
  for i=1, #names do
    vim.print(names[i])
  end
end, {})

vim.api.nvim_create_user_command("PluginUpdateAll", function()
  vim.pack.update()
  vim.cmd("UpdateRemotePlugins")
end, {})
