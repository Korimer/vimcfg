vim.g.boot_colorscheme = "zaibatsu"

local extensions = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "folke/tokyonight.nvim", prioity = 1000, lazy = false, opts = {} },
  { "EdenEast/nightfox.nvim", priority = 1000, lazy = false, opts = {} }
}

vim.keymap.set("n","<A-=>", function()
    if vim.g.all_colorschemes[vim.g.colorscheme_selected+1] == nil
      then vim.g.colorscheme_selected = 1
      else vim.g.colorscheme_selected = vim.g.colorscheme_selected + 1
    end
    vim.cmd("colorscheme " .. vim.g.all_colorschemes[vim.g.colorscheme_selected])
  end
)

vim.api.nvim_create_autocmd("User", {
  pattern="VeryLazy",
  callback=function ()
    local all_colorschemes = vim.fn.getcompletion('',"color")
    vim.g.colorscheme_selected = (function() for i,v in ipairs(all_colorschemes) do if v==vim.g.boot_colorscheme then return i end end end)()
  end
})
return extensions
