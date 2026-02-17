vim.o.wildmenu = true
vim.o.wildoptions = "pum"
vim.cmd("colorscheme " .. vim.g.boot_colorscheme)
vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true} })
vim.o.number = true
vim.keymap.set("i","<C-r>+", "<C-r><C-o>+", {noremap=true, silent=true})
vim.keymap.set({"n","v"}," ","<NOP>", {noremap=true, silent=true})
vim.g.neovide_scale_factor = 0.8

-- two. hundred. opts
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.autoindent = false
vim.opt.smartindent = true
vim.opt.cindent = false
-- and two more
vim.api.nvim_create_autocmd("InsertEnter", { command = [[set norelativenumber]] })
vim.api.nvim_create_autocmd("InsertLeave", { command = [[set relativenumber]] })
