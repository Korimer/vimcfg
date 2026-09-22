-- Editable spec. what langs do I want?
local target_langs = {

  "clangd",
  "superhtml", -- html-lsp from vscode is probably more standard but who cares
  "vtsls",
  "basedpyright", "autopep8", "autoflake",

  "css-lsp",

  {
    name = "lua-language-server",
    alias = "lua_ls",
  },

  {
    name = 'jdtls',
    enable = true,
  }, {
    name = 'openjdk-25',
    enable = false,
  }, {
    name = 'openjdk-17',
    enable = false
  },

  {
    name = "rust-analyzer",
    alias = "rust_analyzer",
  },

  {
    -- For some reason, some extraction tools (or environments??)
    -- will extract "tree-sitter-windows-x64.exe"
    -- and some will extract "tree-sitter.exe"
    name =
      vim.g.env == 'LINUX' and 'tree-sitter-cli'
      or vim.g.env == 'WINDOWS' and 'tree-sitter-cli-win-fix',
    enable = false
  }
}

-- Generate the list of treesitter parsers and their respective lsps
local complete = {}

for i=1, #target_langs do
  local pre_lang = target_langs[i]
  local lang
  if type(pre_lang) == "string" then
    lang = { name = pre_lang }
  else
    lang = pre_lang
  end
  complete[i] = {
    name = lang.name,
    enable = lang.enable or lang.enable == nil,
    lsp_alias = lang.alias or lang.name
  }
end

return complete
