return {
    "nvim-lua/plenary.nvim",
    "editorconfig/editorconfig-vim",
    { "numToStr/Comment.nvim", opts = {} },
    "tpope/vim-surround",
    {
        "mg979/vim-visual-multi",
        init = function()
            vim.g.VM_default_mappings = 0
            vim.g.VM_maps = {
                ["Find Under"] = "<C-a>",
                ["Find Subword Under"] = "<C-a>",
            }
        end,
    },
    { "folke/which-key.nvim", opts = {} },
    { "aserowy/tmux.nvim", opts = {} },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
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
