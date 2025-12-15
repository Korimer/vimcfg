local function has_closing_delimiter_after_cursor(bufnr, cursor_col)
  local ts_utils = require('nvim-treesitter.ts_utils')
  local node = ts_utils.get_node_at_cursor()
  if not node then
    return false
  end
  while node do
    local type = node:type()

    if
      type == "parenthesized_expression"
      or type == "argument_list"
      or type == "parameters"
      or type == "tuple"
      or type == "list"
      or type == "array"
    then
      local _, _, _, end_col = node:range()

      if end_col > cursor_col then
        return true
      end
    end

    node = node:parent()
  end

  return false
end

return {
  {
    -- Note that we screw up literally every keybinding if the setup function for this gets run
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function ()
      local ap = require('nvim-autopairs')
      ap.setup({})
      local aprules = ap.config.rules
      for i=1, #aprules do
        aprules[i].key_map = nil
      end
    end
  },
  {
    'steelsojka/pears.nvim',
    dependencies = {"windwp/nvim-autopairs"},
    config = function() 
      require("pears").setup(function (conf)
        conf.on_enter(
          function () return require'nvim-autopairs'.completion_confirm()
        end)
        conf.pair("(", {
          close = ")",
          should_expand = function(args)
            local row, col = unpack(args.cursor)
            return not has_closing_delimiter_after_cursor(args.bufnr, col)
          end
        })
      end)
    end,
  }
}
