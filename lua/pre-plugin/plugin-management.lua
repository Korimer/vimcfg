vim.api.nvim_create_user_command("PluginUninstallAll", function()
  local pluginNames = {}
  local allPlugins = vim.pack.get()
  for i=1, #allPlugins do
    pluginNames[#pluginNames+1] = allPlugins[i].spec.name
  end
  vim.pack.del(pluginNames)
end, {})

