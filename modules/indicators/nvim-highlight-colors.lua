return {
  'brenoprata10/nvim-highlight-colors',

  config = function (opts)
    vim.opt.termguicolors = true
    require('nvim-highlight-colors').setup(opts)
  end
}
