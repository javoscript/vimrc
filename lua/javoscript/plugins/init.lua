return {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim", -- TODO: check if needed
    "editorconfig/editorconfig-vim",
    -- "tpope/vim-fugitive",                -- TODO
    { "numToStr/Comment.nvim", opts = {} },
    "tpope/vim-surround",
    "mg979/vim-visual-multi",
    { "folke/which-key.nvim", opts = {} },
    { "aserowy/tmux.nvim", opts = {} },
    { "folke/zen-mode.nvim", opts = { plugins = { tmux = { enabled = false } } } },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require("leap").create_default_mappings()
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        lazy = true,
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "mbbill/undotree",
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
    },
}
