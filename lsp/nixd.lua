-- dogshit kludge to make nixd work even remotely intuitively
-- oh my god
local hostname = vim.uv.os_gethostname()
local username = vim.uv.os_get_passwd().username
local cwd = "./."
local expressionFile = vim.my.fn.fromscriptroot("nixd-expressions.nix")
-- Note cwd that cwd is intentionally unquoted
-- This allows nix to treat it as a path, rather than a string
local expressionWithVars = string.format(
  '((import "%s") { hostname="%s"; username="%s"; cwd=%s; })',
  expressionFile,   hostname,      username,      cwd
)

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
        schnixos = {
          expr = expressionWithVars..".nixos-expr",
        },
      --  --["home-manager"] = {
      --  --  expr = home_manager_expr,
      --  --},
      }
    }
  }
}

return nixd_config
