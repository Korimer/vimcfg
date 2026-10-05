return {
  'saghen/blink.pairs',
  dependencies = { 'saghen/blink.lib' },
  version = vim.version.range("*"),

  config = function (opts)
    require('blink.pairs').download():pwait(60000)
    require('blink-pairs').setup(opts)
  end,

  opts = {
    mappings = {
      enabled = true,
      cmdline = true,
      pairs = {},
    },
    highlights = {
      enabled = true,
      cmdline = true,
      groups = { 'BlinkPairsOrange', 'BlinkPairsPurple', 'BlinkPairsBlue' },
      unmatched_group = 'BlinkPairsUnmatched',
      matchparen = {
        enabled = true,
        cmdline = false, -- highlight is currently bugged
        include_surrounding = true,
        group = 'BlinkPairsMatchParen',
        priority = 250
      }
    },
    debug = false
  }
}
