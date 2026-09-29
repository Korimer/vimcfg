local setupFunc = function ()
  vim.g.rainbow_delimiters = {
    strategy = {
      [''] = 'rainbow-delimiters.strategy.global',
      vim = 'rainbow-delimiters.strategy.local',
    },
    query = {
      [''] = 'rainbow-delimiters',
      lua = 'rainbow-blocks',
    },
    priority = {
      [''] = 110,
      lua = 210,
    },
    highlight = {
      'RainbowDelimiterRed',
      'RainbowDelimiterYellow',
      'RainbowDelimiterBlue',
      'RainbowDelimiterOrange',
      'RainbowDelimiterGreen',
      'RainbowDelimiterViolet',
      'RainbowDelimiterCyan',
    },
  }

  require('rainbow-delimiters.setup').setup({
    strategy = {
        -- ...
    },
    query = {
        -- ...
    },
    highlight = {
        -- ...
    },
  })
end
return {
  "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
  config = setupFunc
}
