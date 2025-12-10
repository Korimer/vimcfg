vim.g.boot_colorscheme = "hubbamax"

local extensions = {
  require('extensions.structured.themes.feline'),
  { "catppuccin/nvim", name = "catppuccin" },
  { "alexpasmantier/hubbamax.nvim" },
  { "folke/tokyonight.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "AlexvZyl/nordic.nvim" },
  { "bluz71/vim-moonfly-colors" },
  { "Mofiqul/vscode.nvim" },
  { "craftzdog/solarized-osaka.nvim" },
}

vim.keymap.set("n","<A-=>", function()
    if vim.g.all_colorschemes[vim.g.colorscheme_selected+1] == nil
      then vim.g.colorscheme_selected = 1
      else vim.g.colorscheme_selected = vim.g.colorscheme_selected + 1
    end
    vim.cmd("colorscheme " .. vim.g.all_colorschemes[vim.g.colorscheme_selected])
  end
)
vim.keymap.set("n","<A-->", function()
    if vim.g.all_colorschemes[vim.g.colorscheme_selected-1] == nil
      then vim.g.colorscheme_selected = #vim.g.all_colorschemes
      else vim.g.colorscheme_selected = vim.g.colorscheme_selected -1
    end
    vim.cmd("colorscheme " .. vim.g.all_colorschemes[vim.g.colorscheme_selected])
  end
)

vim.api.nvim_create_autocmd("User", {
  pattern="LazyDone",
  callback=function ()
    vim.g.all_colorschemes = vim.fn.getcompletion('',"color")
    vim.g.colorscheme_selected = (function() for i,v in ipairs(vim.g.all_colorschemes) do if v==vim.g.boot_colorscheme then return i end end end)()
  end
})
return extensions
