local vf = vim.fn
local fs = vim.fs

vim.my = {}
vim.my.fn = {}

local sessiondir = fs.joinpath(vf.stdpath('data'),"sessions")
vf.mkdir(sessiondir, "p")
vim.g.sessiondir = sessiondir

vim.g.color_prefs = { 'catpuccin-nvim', 'habamax' }

-- { "blue", "carbonfox", "catppuccin", "catppuccin-frappe", "catppuccin-latte", "catppuccin-macchiato", "catppuccin-mocha", "catppuccin-nvim", "darkblue", "dawnfox", "dayfox", "default", "delek", "desert", "duskfox", "elflord", "evening", "habamax", "hubbamax", "industry", "koehler", "loucolor", "lunaperche", "moonfly", "morning", "murphy", "nightfox", "nordfox", "nordic", "pablo", "peachpuff", "quiet", "retrobox", "ron", "shine", "slate", "solarized-osaka", "solarized-osaka-light", "solarized-osaka-vivid", "sorbet", "terafox", "tokyonight", "tokyonight-day", "tokyonight-moon", "tokyonight-night", "tokyonight-storm", "torte", "unokai", "vim", "vscode", "wildcharm", "zaibatsu", "zellner" }
