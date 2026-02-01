local sep = vim.g.path_sep
local jdtls_dir = vim.fn.stdpath('data') .. sep .. 'mason' .. sep .. 'packages' .. sep .. 'jdtls'

local os_dir
if vim.g.env == "WINDOWS" then
  os_dir = 'config_win'
elseif vim.g.env == "LINUX" then
  os_dir = 'config_linux'
else
  error("Errror: Unrecognized operating system, cannot determine proper jdtls config.")
end

local shared_config_path = jdtls_dir .. sep .. os_dir
local sharedconfig = { "-Dosgi.sharedConfiguration.area=" + shared_config_path }

local simple_single = {
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-Dosgi.checkConfiguration=true",
  "-Dosgi.sharedConfiguration.area.readOnly=true",
  "-Dosgi.configuration.cascaded=true",
  "-Xms1G",
}

local single_arg = {bundles, shared_config}

local simple_double = {
  "--add-modules=ALL-SYSTEM",
  "--add-opens", "java.base/java.util=ALL-UNNAMED",
  "--add-opens", "java.base/java.lang=ALL-UNNAMED"
}

local double_arg = {}
local opt_config = {
  -- "--jvm-arg=-Dlog.level=ALL"
}
local function Get_command()
  return {
    
  }
end

return {
  enabled=true,
  'mfussenegger/nvim-jdtls',
  dependencies = { "neovim/nvim-lspconfig" },
}
