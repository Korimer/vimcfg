return {
  'saghen/blink.pairs',
  dependencies = { 'saghen/blink.lib' },
  -- either this or download them from the github releases tab which is despicable bro wth
  build = vim.g.distro_name == "NixOS"
    and "nix-shell -p stdenv.cc.cc --run 'cargo build --release'"
    or "cargo +nightly build --release",

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
