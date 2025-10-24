return {
  init_options = {
    java = {
      configuration = {
        -- These are potential runtimes that the project can use. I believe for these to be used, the maven or
        -- gradle config files need to specify that a specific runtime should be used, or you can set it with
        -- :JdtSetRuntime.
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = "/usr/lib/jvm/java-8-openjdk/",
          },{
            name = "JavaSE-11",
            path = "/usr/lib/jvm/java-11-openjdk/",
          },{
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk/",
          },
        },
      },
    },
  }
}
