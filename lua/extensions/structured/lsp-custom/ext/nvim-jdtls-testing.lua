local sep = vim.g.path_sep
local mason_dir = vim.fn.stdpath('data') .. sep .. 'mason' 
local jdtls_dir = mason_dir .. sep .. 'packages'.. sep .. 'jdtls'

local os_dir
if vim.g.env == "WINDOWS" then
  os_dir = 'config_win'
elseif vim.g.env == "LINUX" then
  os_dir = 'config_linux'
else
  error("Errror: Unrecognized operating system, cannot determine proper jdtls config.")
end

local shared_config_path = jdtls_dir .. sep .. os_dir
local sharedconfig_cmd = { "-Dosgi.sharedConfiguration.area=" .. shared_config_path }

local simple_single = {
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-Dosgi.checkConfiguration=true",
  "-Dosgi.sharedConfiguration.area.readOnly=true",
  "-Dosgi.configuration.cascaded=true",
  "-Xms1G",
}

local simple_double = {
  "--add-modules=ALL-SYSTEM",
  "--add-opens", "java.base/java.util=ALL-UNNAMED",
  "--add-opens", "java.base/java.lang=ALL-UNNAMED"
}

local opt_config = {
  -- "--jvm-arg=-Dlog.level=ALL"
}

local plugin_dir = jdtls_dir .. sep .. "plugins" .. sep
local plugin = vim.fn.glob(plugin_dir .. sep .. "org.eclipse.equinox.launcher_*",false,true)[1]
local jarfile_cmd = { '-jar', plugin }

local data_cmd = function ()
  return {
    '-data',
    vim.fn.stdpath('cache') .. sep .. "jdtls-" .. vim.fn.fnamemodify(vim.fn.getcwd(),':t')
  }
end


local function Get_command(dispatchers,config)
  vim.print(dispatchers)
  vim.print(config)
  local full_command_set = {
    {"java"},
    simple_single,
    sharedconfig_cmd,
    simple_double,
    opt_config,
    jarfile_cmd,
    data_cmd()
  }
  local full_command = {}
  for i=1, #full_command_set do
    vim.list_extend(full_command,full_command_set[i])
  end
  vim.notify(vim.fn.join(full_command," "))
  return vim.lsp.rpc.start(
    full_command,
    dispatchers,
    {
      cwd = config.cwd,
      env = config.cmd_env,
      detached = config.detached
    }
  )
end

return {
  enabled=true,
  'mfussenegger/nvim-jdtls',
  dependencies = { "neovim/nvim-lspconfig" },
  config = function ()
    vim.lsp.config("jdtls", {
      cmd = Get_command
    })
  end
}
