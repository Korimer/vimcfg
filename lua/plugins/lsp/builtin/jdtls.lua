return {
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-17",
            path = 'C:\\Program Files\\Common Files\\Oracle\\Java\\javapath_target_712252484' --vim.fn.stdpath('data') .. '\\mason'
          },
        }
      }
    }
  }
}
