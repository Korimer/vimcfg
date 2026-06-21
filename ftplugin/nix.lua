-- ftplugin/nix.lua

-- Enable C-style indenting
vim.bo.cindent = true

-- Keys that trigger re-indenting in insert mode
vim.bo.cinkeys = "0{,0},0),:,!^F,o,O,e"

-- C indentation style options (adjust to taste)
vim.bo.cinoptions = "l1,t0,(0,u0,U1"

-- Keywords that increase indent on the next line
vim.bo.cinwords = "if,else,while,do,for,switch,case"

-- Scope declaration keywords (C++)
vim.bo.cinscopedecls = "public,protected,private"
