return {
  "famiu/feline.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim"
  },
  cond = vim.o.termguicolors,
  config = function ()
    require('feline').setup()
    require('feline').winbar.setup()
    vim.o.laststatus = 0
  end
}
