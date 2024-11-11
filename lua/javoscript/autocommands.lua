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

local au_duck_nvim = vim.api.nvim_create_augroup("duck_nvim", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    group = au_duck_nvim,
    pattern = {
        vim.fn.expand("~") .. "/.config/nvim*",
    },
    callback = function(_ev)
        require("duck").hatch("🐏")
        require("duck").hatch("🐑")
        require("duck").hatch("🐕")
        require("duck").hatch("🐕")
        require("duck").hatch("🐥")
        require("duck").hatch("🐥")
        require("duck").hatch("🐓")
        require("duck").hatch("🐓")
        require("duck").hatch("🧍")
        require("duck").hatch("🧍")
    end,
})

-- dbui
vim.cmd([[
  autocmd FileType dbout setlocal nofoldenable
  autocmd FileType dbout nmap <buffer> q gq
  autocmd FileType dbui nmap <buffer> <C-j> <C-w>j
  autocmd FileType dbui nmap <buffer> <C-k> <C-w>k
]])
