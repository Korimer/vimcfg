-- Editable spec. what langs do I want?
local target_langs = {
  vim = {},
  nix = {},
  diff = {},
  regex = {},
  luadoc = {},
  printf = {},
  vimdoc = {},
  markdown = {},
  markdown_inline = {},

  c = {"clangd"},
  cpp = {"clangd"},
  html = {"superhtml"}, -- html-lsp from vscode is probably more standard but who cares
  javascript = {"vtsls"},
  typescript = {"vtsls"},
  python = {"basedpyright"},

  lua = {
    {
      name = "lua-language-server",
      alias = "lua_ls",
    }
  },

  java = {
    {
      name = 'jdtls',
      enable = false,
    }, {
      name = 'openjdk-25',
      enable = false,
    }, {
      name = 'openjdk-17',
      enable = false
    }
  }, --,"java-test","java-debug-adapter"} 

  rust = {
    {
      name = "rust-analyzer",
      alias = "rust_analyzer",
    }
  }
}

-- Generate the list of treesitter parsers and their respective lsps
local i = 1
local parserlist = {}

local simple_cnt = 1
local spec_cnt = 1
local overlap = {}

local lsp_simple = {}
local lsp_spec = {}
local lsp_all = {}
for k, v in pairs(target_langs) do
  parserlist[i] = k
  i = i+1
  for _, dep in ipairs(v) do
    if type(dep) == "string" then
      if not overlap[dep] then
        overlap[dep] = simple_cnt
        lsp_simple[simple_cnt] = dep
        lsp_all[simple_cnt+spec_cnt-1] = dep
        simple_cnt = simple_cnt + 1
      end
    else
      if not overlap[dep.name] then
        overlap[dep.name] = spec_cnt
        lsp_spec[spec_cnt] = {}
        lsp_all[simple_cnt+spec_cnt-1] = dep.name
        spec_cnt = spec_cnt + 1
      end
      lsp_spec[overlap[dep.name]] =
          vim.tbl_extend("force",lsp_spec[overlap[dep.name]],dep)
    end
  end
end

-- return convenient references for everything
return {
  ts_parsers = parserlist,
  lsp_simple = lsp_simple,
  lsp_spec = lsp_spec,
  lsp_all = lsp_all
}
