return {
  root_markers = {{'build.gradle'},'.git'},
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
            path = 'C:\\Program Files\\Common Files\\Oracle\\Java\\javapath' --vim.fn.stdpath('data') .. '\\mason'
          },
        }
      }
    }
  }
}
