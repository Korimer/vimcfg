local lsp_list = require('config.lang')

local full_spec = {}
local external_lsp_repos = vim.api.nvim_get_runtime_file("lua/plugins/lsp-custom/ext/*.lua",true)
for i=1, #external_lsp_repos do
  full_spec[i] = require('plugins.lsp-custom.ext.' .. vim.fn.fnamemodify(external_lsp_repos[i], ':t:r'))
end
full_spec[#external_lsp_repos] = require('plugins.lsp-custom.lspconfig')

return full_spec
