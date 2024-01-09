vim.cmd([[
  augroup _lsp
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format()
  augroup end
]])

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function(_data)
        require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
    end,
})
