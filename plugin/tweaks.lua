vim.keymap.set('c', '<Up>',    function() return vim.fn.wildmenumode() ~= 0 and '<Left>' or '<Up>' end, { expr = true })
vim.keymap.set('c', '<Down>',  function() return vim.fn.wildmenumode() ~= 0 and '<Right>' or '<Down>' end, { expr = true })
vim.keymap.set('c', '<Left>',  function() return vim.fn.wildmenumode() ~= 0 and '<Up>' or '<Left>' end, { expr = true })
vim.keymap.set('c', '<Right>', function() return vim.fn.wildmenumode() ~= 0 and '<BS><C-Z>' or '<Right>' end, { expr = true })

-- vim.opt.noh = true;

vim.print("this ran btw")
