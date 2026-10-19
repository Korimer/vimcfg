vim.opt.laststatus = 3 -- Aka one global statusline
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sections = {
      lualine_x = {
        function()
          return require('direnv').statusline()
        end,
        'encoding',
        'fileformat',
        'filetype',
      },
      lualine_c = {
        {
          function()
            return require('nvim-navic').get_location()
          end,
          cond = function()
            return require('nvim-navic').is_available()
          end
        },
      }
    },
    options = {
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    }
  }
}
