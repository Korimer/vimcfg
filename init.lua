if vim.loader then
    vim.loader.enable()
end
-- give me a leader button
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- give me good indentation
vim.cmd("set noautoindent")
vim.cmd("set smartindent")
vim.cmd("set nocindent")

-- set termguicolors so my plugins dont break
vim.cmd("set termguicolors")

-- give me knowledge of what os i have
vim.g.sysname = vim.loop.os_uname().sysname
local sys_upper = string.upper(vim.g.sysname)
local systems = {"WINDOWS","LINUX","MINGW","DARWIN"}
for i=1, 4 do
  if string.match(sys_upper,systems[i]) then vim.g.env = systems[i] end
end

if vim.g.env == "WINDOWS" then
  vim.opt.runtimepath:prepend("C:/Program Files/Git/usr/bin;")
  vim.g.path_sep = "\\"
  --vim.env.PATH = "C:/Program Files/Git/usr/bin;" .. vim.env.PATH
else
  vim.g.path_sep = "/"
end

local distro = nil
local h = io.popen('uname -a')
local uname = h:read('*a')
if string.match(uname,"NixOS") then distro = "NixOS" end
vim.g.distro_name = distro
h:close()

Ori = require('config.funcs')
----------------------
-- Lazy nvim bootstrap
----------------------

-- kludge to import everything in the modules folder
local allModules = {}
local moduleRoot = vim.fs.joinpath(vim.fn.stdpath("config"), "modules")
for name, ftype, err in vim.fs.dir(moduleRoot, {depth=9}) do
  if ftype == "file" and string.match(name,"[.]lua$") then
    local oldPath = package.path
    local moduleAbsolutePath = vim.fs.joinpath(moduleRoot,name)
    local moduleName = vim.fn.fnamemodify(moduleAbsolutePath,":t:r")
    vim.print(moduleAbsolutePath)
    vim.print(moduleName)

    package.path = moduleAbsolutePath
    allModules[#allModules+1] = require(moduleName)

    package.path = oldPath
  end
end

local lazyArgs = {
  git = {
    url_format =
      (vim.g.env == "WINDOWS" and "https://github.com/%s.git")
      or (vim.g.env == "LINUX" and "git@github.com:/%s.git")
    },
  spec = allModules,
  change_detection = {
    enabled = true,
    notify = false,
  },
  -- No luarocks
  rocks = { enabled = false },
  -- automatically check for plugin updates once a day
  checker = { enabled = true, frequency = (60*60*24) },
}

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(lazyArgs)
