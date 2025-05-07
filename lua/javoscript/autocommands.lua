vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    desc = "Briefly highlight yanked text",
    group = vim.api.nvim_create_augroup("yank", { clear = true }),
})

local au_markdown = vim.api.nvim_create_augroup("markdown", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged", "BufEnter" }, {
    group = au_markdown,
    pattern = { vim.fn.expand("~") .. "/Notes*" },
    callback = function(_ev)
        vim.api.nvim_win_set_option(0, "conceallevel", 2)
        vim.opt.spell = true
        -- vim.opt.wrap = true
        -- vim.opt.linebreak = true
        -- vim.opt.colorcolumn = "80"
    end,
})

-- dbui
vim.cmd([[
  autocmd FileType dbout setlocal nofoldenable
  autocmd FileType dbout nmap <buffer> q gq
  autocmd FileType dbui nmap <buffer> <C-j> <C-w>j
  autocmd FileType dbui nmap <buffer> <C-k> <C-w>k
  autocmd FileType dbui nmap <buffer> l <Plug>(DBUI_SelectLine)
]])
