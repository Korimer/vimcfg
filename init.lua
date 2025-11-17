-- give me a leader button
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- give me knowledge of what os i have
vim.g.sysname = vim.loop.os_uname().sysname
local sys_upper = string.upper(vim.g.sysname)
local systems = {"WINDOWS","LINUX","MINGW","DARWIN"}
for i=1, 4 do
  if string.match(sys_upper,systems[i]) then vim.g.env = systems[i] end
end

local distro = nil
local h = io.popen('uname -a')
local uname = h:read('*a')
if string.match(uname,"NixOS") then distro = "NixOS" end
vim.g.distro_name = distro
h:close()

-- give me my extensions (lol)
require('config.lazy')
