local configFuncs = {}
local queueConfig = function (name, spec)
  if spec["opts"] ~= nil then
    if spec["config"] == nil then
      configFuncs[#configFuncs+1] = function() require(name).setup(spec["opts"]) end
    else
      vim.notify("WARNING: you should not set both opts and config.", vim.log.levels.WARN)
    end
  elseif spec["config"] then
    configFuncs[#configFuncs+1] = spec["config"]
  end
end

local resolveURL = function(modsource)
  if string.match(modsource,"^https://") then
    return modsource
  else
    return "https://github.com/" .. modsource .. ".git"
  end
end

local reParseArgs = function(filename, spec)
  local simpleName = vim.fn.fnamemodify(filename, ":t:r")
  queueConfig(simpleName, spec)
  if spec[1] ~= nil then
    spec["src"] = spec[1]
  end
  spec["src"] = resolveURL(spec["src"])
  if spec["dependencies"] == nil then
    spec["dependencies"] = {}
  else
    for i=1, #spec["dependencies"] do
      spec["dependencies"][i] = resolveURL(spec["dependencies"][i])
    end
  end
end

local allModules = {}
local moduleRoot = vim.fs.joinpath(vim.fn.stdpath("config"), "modules")
for name, ftype, err in vim.fs.dir(moduleRoot, {depth=9}) do
  if ftype == "file" and string.match(name,"[.]lua$") then
    local moduleAbsolutePath = vim.fs.joinpath(moduleRoot,name)
    local spec = dofile(moduleAbsolutePath)
    if spec ~= nil then
      reParseArgs(name, spec)
      allModules[#allModules+1] = spec
      for i=1, #spec["dependencies"] do
        allModules[#allModules+1] = spec["dependencies"][i]
      end
    else
      vim.notify("WARNING: spec is nil for file" .. moduleAbsolutePath, vim.log.levels.WARN)
    end
  end
end

vim.pack.add(allModules, {confirm=false})
for i=1, #configFuncs do
  configFuncs[i]()
end
