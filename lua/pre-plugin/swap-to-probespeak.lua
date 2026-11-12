local oldfont = vim.o.guifont
local probespeak = function ()
  if vim.o.guifont == "PROBESPEAKAZ2:h14" then
    vim.o.guifont = oldfont
    vim.g.neovide_scale_factor = 0.8
  else
    vim.o.guifont = "PROBESPEAKAZ2:h14"
    vim.g.neovide_scale_factor = 1
  end
end
vim.keymap.set('n',' SP',probespeak,{noremap=true; silent=true})
