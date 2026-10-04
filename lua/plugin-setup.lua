local configFuncs = {}
local queueConfig = function (spec)
  -- If neither opts nor config is set, do nothing
  if spec["opts"] == nil and spec["config"] == nil then
    return spec
  end

  local opts = spec["opts"] or {}
  local configFunc
  if spec["config"] == nil then
    -- By default, run setup specified by name
    configFunc = function() require(spec["name"]).setup(opts) end
  else
    -- Otherwise, run the user-provided config func
    configFunc = function() spec["config"](opts) end
  end
  configFuncs[#configFuncs+1] = configFunc
end

local resolveURL = function(modsource)
  if string.match(modsource,"^https://") then
    return modsource
  else
    return "https://github.com/" .. modsource .. ".git"
  end
end

local reParseArgs = function(filename, spec)
  if spec == nil then return nil end

  spec["name"] = spec["name"] or vim.fn.fnamemodify(filename, ":t:r")
  queueConfig(spec)

  if spec[1] == nil and spec["src"] == nil then
    return nil
  elseif spec[1] ~= nil then
    spec["src"] = resolveURL(spec[1])
  elseif spec["src"] ~= nil then
    spec["src"] = resolveURL(spec["src"])
  else
    vim.notify("WARNING: should not set both array[1] and array['src'] for module " .. filename, vim.log.levels.WARN)
  end

  if spec["dependencies"] == nil then
    spec["dependencies"] = {}
  end
  for i=1, #spec["dependencies"] do
    spec["dependencies"][i] = resolveURL(spec["dependencies"][i])
  end

  return spec
end

local filenameIsValid = function (filename)
  local shortname = vim.fn.fnamemodify(filename, ":t")
  local is_lua = string.match(shortname,"%.lua$") 
  local is_visible = not string.match(shortname,"^[_.]")
  return is_lua and is_visible
end

local allModules = {}
local moduleRoot = vim.fs.joinpath(vim.fn.stdpath("config"), "modules")
for name, ftype, err in vim.fs.dir(moduleRoot, {depth=9}) do
  if ftype == "file" and filenameIsValid(name) then
    local moduleAbsolutePath = vim.fs.joinpath(moduleRoot,name)
    local spec = dofile(moduleAbsolutePath)
    spec = reParseArgs(name, spec)
    if spec ~= nil then
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
