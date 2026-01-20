vim.o.wildmenu = true
vim.o.wildoptions = "pum"
vim.cmd("colorscheme " .. vim.g.boot_colorscheme)
vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true} })
vim.o.number = true
vim.keymap.set("i","<C-r>+", "<C-r><C-o>+", {noremap=true, silent=true})
vim.keymap.set({"n","v"}," ","<NOP>", {noremap=true, silent=true})
