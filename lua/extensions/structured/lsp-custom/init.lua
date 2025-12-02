local full_spec = {require('extensions.structured.lsp-custom.lspconfig')}
local external_lsp_repos = vim.api.nvim_get_runtime_file("lua/extensions/lsp-custom/ext/*.lua",true)
for i=1, #external_lsp_repos do
  full_spec[i+1] = require('extensions.structured.lsp-custom.ext.' .. vim.fn.fnamemodify(external_lsp_repos[i], ':t:r'))
end

return full_spec
