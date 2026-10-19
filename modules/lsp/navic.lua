return {
  "SmiteshP/nvim-navic",
  dependencies = { 'SmiteshP/nvim-navbuddy' },

  config = function ()
    local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
            require('nvim-navic').attach(client, bufnr)
            require('nvim-navbuddy').attach(client, bufnr)
        end
    end

    vim.lsp.config('*', {
        on_attach = on_attach
    })
  end
}
