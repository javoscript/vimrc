return {
    {
        "catppuccin/nvim",
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
        --     vim.cmd([[colorscheme catppuccin-mocha]])
        -- end,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme duskfox]])
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
        --     require("github-theme").setup({})
        --     vim.cmd("colorscheme github_dark_high_contrast")
        -- end,
    },
}
