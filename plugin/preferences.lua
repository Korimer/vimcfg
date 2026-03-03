vim.opt.wildmenu = true
vim.opt.wildoptions = "pum"
vim.cmd("colorscheme " .. vim.g.boot_colorscheme)
vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true} })
vim.g.neovide_scale_factor = 0.8

vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
-- give me tabs like a normal editor PLEASE
vim.opt.expandtab = true;
vim.opt.softtabstop = 2;
vim.opt.shiftwidth = 2;
vim.opt.smarttab = true;

-- two. hundred. opts
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.autoindent = false
vim.opt.smartindent = true
vim.opt.cindent = false
-- and two more
vim.api.nvim_create_autocmd("InsertEnter", { command = [[set norelativenumber]] })
vim.api.nvim_create_autocmd("InsertLeave", { command = [[set relativenumber]] })
