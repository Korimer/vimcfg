local vf = vim.fn
local fs = vim.fs


local sessiondir = fs.joinpath(vf.stdpath('data'),"sessions")
vf.mkdir(sessiondir, "p")
vim.g.sessiondir = sessiondir

vim.g.color_prefs = { 'tokyonight', 'habamax' }
