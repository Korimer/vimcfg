-- had it up to here with whoever is behind nixd
-- dipshits cannot write something intuitive to save their lives
-- oh my god
local expressionFile = string.format('"%s"', vim.my.fn.fromscriptroot("nixd-expressions.nix"))
local expressionEval = "(import "..expressionFile.." ./.)"

---@type vim.lsp.Config
local nixd_config = {
  cmd_env = {
    -- I shouldnt need to do this
    NIX_CONFIG = "experimental-features = nix-command flakes pipe-operators"
  },
  settings = {
    nixd = {
      nixpkgs = {
        -- This should be the default but nixd explodes if i dont manually state it
        expr = "import <nixpkgs> { }",
      },
      options = {
        nixos = {
          expr = expressionEval..".nixos-expr",
        },
      --  --["home-manager"] = {
      --  --  expr = home_manager_expr,
      --  --},
      }
    }
  }
}

return nixd_config
