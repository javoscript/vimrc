-- lsp autoformat
vim.cmd([[
  augroup _lsp
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format()
  augroup end
]])

-- obsidian
local au_obsidian = vim.api.nvim_create_augroup("obsidian", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
    group = au_obsidian,
    pattern = { vim.fn.expand("~") .. "/Notes/vault*" },
    callback = function(_ev)
        vim.api.nvim_win_set_option(0, "conceallevel", 1)
        vim.opt.spell = true
    end,
})

-- dbui
vim.cmd([[
  autocmd FileType dbout setlocal nofoldenable
  autocmd FileType dbout nmap <buffer> q gq
  autocmd FileType dbui nmap <buffer> <C-j> <C-w>j
  autocmd FileType dbui nmap <buffer> <C-k> <C-w>k
]])
