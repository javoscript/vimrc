return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            enabled = false,
        },
    },
    {
        "echasnovski/mini.indentscope",
        version = "*",
        config = function()
            require("mini.indentscope").setup({})
        end,
        init = function()
            -- Disable mini.indentscope for markdown files
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
}
