return {
    {
        "vim-test/vim-test",
        config = function()
            vim.cmd([[
                let g:test#strategy = 'neovim'
                let test#neovim#term_position = "vert"
                let g:test#neovim#start_normal = 1
            ]])

            local au_vim_test = vim.api.nvim_create_augroup("vim_test", { clear = true })

            vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged", "BufEnter" }, {
                group = au_vim_test,
                pattern = {
                    vim.fn.expand("~") .. "/Development/cycle/subscription-api*",
                },
                callback = function(_ev)
                    vim.cmd([[
                        let test#php#phpunit#executable = "php artisan test --exclude-group external"
                    ]])
                end,
            })
        end,
    },
    -- {
    --     "nvim-neotest/neotest",
    --     dependencies = {
    --         "nvim-neotest/nvim-nio",
    --         "nvim-lua/plenary.nvim",
    --         "antoinemadec/FixCursorHold.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --         -- "vim-test/vim-test",
    --     },
    -- },
}
