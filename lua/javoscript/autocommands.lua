vim.cmd([[
  augroup _lsp
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format()
  augroup end
]])

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function(data)
        -- buffer is a real file on the disk
        local real_file = vim.fn.filereadable(data.file) == 1

        -- buffer is a [No Name]
        local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

        if not real_file and not no_name then
            return
        end

        -- open the tree, find the file but don't focus it
        require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
    end,
})

local au_obsidian = vim.api.nvim_create_augroup("obsidian", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
    group = au_obsidian,
    pattern = { vim.fn.expand("~") .. "/Notes/vault*" },
    callback = function(_ev)
        vim.api.nvim_win_set_option(0, "conceallevel", 1)
    end,
})
