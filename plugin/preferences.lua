vim.o.wildmenu = true
vim.o.wildoptions = "pum"
vim.cmd("colorscheme " .. vim.g.boot_colorscheme)
vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true} })
vim.o.number = true
