spec looks like
```
{
    -- str in format "User/Repo", "git@github.com:User/Repo", or "https://github.com/User/Repo"
    -- false == do not install any plugin
    -- nil == same as false, but throws a warning
    src = str | false | nil

    -- name of the plugin, for use in config
    -- if nil, determined based on the name of the file itself (eg, a spec defined in alpha.lua will be named "alpha")
    name = str | nil

    -- opts to pass to the setup/configuration function of a plugin
    -- if nil, treated as an empty table
    opts = table | nil

    -- function(opts) - function to run after installing all plugins
    -- if true, operates as if the function was require(name).setup(opts)
    -- if false, no function is ran.
    -- if nil, same behavior as true when "opts" is not nil. otherwise, same behavior as false.
    config = function | true | false | nil

    -- list of simple plugins requiring no setup, all conforming to the naming scheme defined in src
    -- if nil, treated as an empty list
    dependencies = table | nil
}
```
