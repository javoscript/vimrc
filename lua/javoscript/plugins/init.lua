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
    { "aserowy/tmux.nvim", opts = {} },
    { "folke/zen-mode.nvim", opts = {} },
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
    -- lazy.nvim
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        event = "VeryLazy",
        opts = {
            presets = {
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true,
                lsp_doc_border = true,
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
}
