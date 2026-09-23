-- Please give me an actual popup completion menu in the terminal thank you
vim.opt.wildmenu = true
vim.opt.wildoptions = "pum"
vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true} })

-- ok
vim.opt.sessionoptions = "blank,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- visuals while editing
vim.opt.cursorline = true
vim.opt.number = true
vim.cmd("set relativenumber")
vim.api.nvim_create_autocmd("InsertEnter", { command = [[set norelativenumber]] })
vim.api.nvim_create_autocmd("InsertLeave", { command = [[set relativenumber]] })
