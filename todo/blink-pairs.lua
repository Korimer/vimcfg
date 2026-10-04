vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("PluginBuildHooks", { clear = true }),
  callback = function(ev)
    -- Only run hooks on install or update, ignore deletions
    if ev.data.kind == "install" or ev.data.kind == "update" then

      -- Run a build step for a specific plugin
      if ev.data.spec.name == "blink.pairs" then
        require('blink.pairs').download():pwait(60000)
      end
    end
  end,
})

return {
  'saghen/blink.pairs',
  dependencies = { 'saghen/blink.lib' },
  -- either this or download them from the github releases tab which is despicable bro wth
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
