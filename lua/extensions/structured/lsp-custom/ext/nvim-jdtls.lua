local mason_path = vim.fn.stdpath('data') .. "/mason/packages"

local jdk_most_recent = mason_path .. "/openjdk-25/jdk-25.0.1"
local jdtls_most_recent = vim.split(vim.fn.glob(mason_path .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),'\n')[1]

local config_directory = mason_path .. "/jdtls/config_win"

local dynamic_command = function(project_name)
  return {
    jdk_most_recent .. "/bin/java.exe", -- jdtls = python wrapper for "convenience", java = the actual setup
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-Xmx1G",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
    "-jar",
      jdtls_most_recent,
    "-configuration",
      config_directory,
    "-data",
      vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace",
  }
end

local get_cur_dir = function()
  return vim.api.nvim_buf_get_name(0)
end

local get_root_dir = function(fname)
  return vim.fs.root(fname, vim.lsp.config.jdtls.root_markers)
end

local get_workspace_dir = function(rdir)
  if rdir == nil then
    return vim.fn.stdir('cache') .. "/jdtls/_unnamed_project/workspace"
  else
    return vim.fs.basename(rdir)
  end
end

local jdtl_config = function()
  local root_directory = get_root_dir(get_cur_dir())
  local cmd = dynamic_command(get_workspace_dir(root_directory))
  return {
    cmd = cmd,
    name = "jdtls",
    on_attach = function () end, -- for later use...
    filetypes = { "java" },
    root_dir = root_directory,
    -- see https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    settings = {
      java = {
        inlayHints = { parameterNames = { enabled = "all" } },
        eclipse = { downloadSources = true },
        configuration = {
          updateBuildConfiguration = "interactive",
          runtimes = {
            {
              name = "JavaSE-17",
              path = mason_path .. "/openjdk-17/jdk-17.0.2"
            },
            {
              name = "JavaSE-25",
              path = mason_path .. "/openjdk-25/jdk-25.0.1"
            }
          },
        },
      }
    },
    -- for use with other extensions
  }
end

return {
  'mfussenegger/nvim-jdtls',
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        require('jdtls').start_or_attach(jdtl_config())

      end
    })
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function()
        if client == nil then return nil end
        if client.name ~= 'jdtls' then return nil end
      end
    })
  end
}
