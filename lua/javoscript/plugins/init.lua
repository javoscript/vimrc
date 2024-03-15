return {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim", -- TODO: check if needed
    "editorconfig/editorconfig-vim",
    -- "tpope/vim-fugitive",                -- TODO
    { "numToStr/Comment.nvim", opts = {} },
    "tpope/vim-surround",
    "mg979/vim-visual-multi",
    { "folke/which-key.nvim", opts = {} },
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
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
    { "aserowy/tmux.nvim", opts = {} },
    { "folke/zen-mode.nvim", opts = { plugins = { tmux = { enabled = false } } } },
    {
        "vim-test/vim-test",
        config = function()
            vim.cmd([[
                let g:test#strategy = 'neovim'
                let test#neovim#term_position = "vert"
                let g:test#neovim#start_normal = 1
            ]])
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
}
