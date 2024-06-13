return {
    "vim-test/vim-test",
    config = function()
        vim.cmd([[
                " let g:test#strategy = 'basic'
                let g:test#strategy = 'neovim'
                let test#neovim#term_position = "vert"
                let g:test#neovim#start_normal = 1
                let g:test#basic#start_normal = 1
                let test#php#phpunit#executable = './vendor/bin/phpunit'
            ]])

        local au_vim_test = vim.api.nvim_create_augroup("vim_test", { clear = true })
        vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged", "BufEnter" }, {
            group = au_vim_test,
            pattern = {
                vim.fn.expand("~") .. "/Development/cycle/subscription-api*",
            },
            callback = function(_ev)
                vim.cmd([[
                    let test#php#phpunit#executable = "php artisan test --configuration phpunit-gitlab-ci.xml --exclude external"
                ]])
            end,
        })
    end,
}
