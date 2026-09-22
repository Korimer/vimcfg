local executeConfig = function (name, spec)
  if spec["opts"] ~= nil then
    if spec["config"] == nil then
      require(name).setup(spec["opts"])
    else
      vim.notify("WARNING: you should not set both opts and config.", vim.log.levels.WARN)
    end
  elseif spec["config"] then
    spec["config"]()
  end
end

local reParseArgs = function(filename, spec)
  local simpleName = vim.fn.fnamemodify(filename, ":t:r")
  executeConfig(simpleName, spec)
  if spec["dependencies"] == nil then
    spec["dependencies"] = {}
  end
end

local allModules = {}
local moduleRoot = vim.fs.joinpath(vim.fn.stdpath("config"), "modules")
for name, ftype, err in vim.fs.dir(moduleRoot, {depth=9}) do
  if ftype == "file" and string.match(name,"[.]lua$") then
    local moduleAbsolutePath = vim.fs.joinpath(moduleRoot,name)
    local spec = dofile(moduleAbsolutePath)
    reParseArgs(name, spec)
    allModules[#allModules+1] = spec
    for i=1, #spec["dependencies"] do
      allModules[#allModules+1] = spec["dependencies"][i]
    end
  end
end

vim.pack.add(allModules, {confirm=false})
