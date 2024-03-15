-- lsp autoformat
vim.cmd([[
  augroup _lsp
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format()
  augroup end
]])

local au_markdown = vim.api.nvim_create_augroup("markdown", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
    group = au_markdown,
    pattern = { vim.fn.expand("~") .. "/notes*" },
    callback = function(_ev)
        vim.api.nvim_win_set_option(0, "conceallevel", 0)
        vim.opt.spell = true
        vim.opt.wrap = true
        vim.opt.linebreak = true
        vim.opt.colorcolumn = "80"
    end,
})

-- dbui
vim.cmd([[
  autocmd FileType dbout setlocal nofoldenable
  autocmd FileType dbout nmap <buffer> q gq
  autocmd FileType dbui nmap <buffer> <C-j> <C-w>j
  autocmd FileType dbui nmap <buffer> <C-k> <C-w>k
]])
