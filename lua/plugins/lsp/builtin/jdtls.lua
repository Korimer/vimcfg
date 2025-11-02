vim.lsp.config('jdtls', {
  root_markers = {{'build.gradle'},'.git'}
})
return {}
--{
--  root_markers = {{'build.gradle'},'.git'},
--  settings = {
--    java = {
--      eclipse = {
--        downloadSources = true,
--      },
--      configuration = {
--        updateBuildConfiguration = "interactive",
--        runtimes = {
--          {
--            name = "JavaSE-17",
--            path = 'C:\\Users\\K\\AppData\\Local\\nvim-data\\mason\\packages\\openjdk-17\\jdk-17.0.2' --vim.fn.stdpath('data') .. '\\mason'
--          },
--        }
--      }
--    }
--  }
--}
