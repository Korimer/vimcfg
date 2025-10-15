return {
    "preservim/nerdtree"
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "nerdtree"
            callback = function()
                vim.keymap.set('n','<C-CR>','<cmd>lua vim.print("hi hi it worked")<CR>', { buffer = true })
            end
        })
    end
}
