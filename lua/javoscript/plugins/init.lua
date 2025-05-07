return {
    -- TODO: neoclip -> clipboard manager in nvim
    -- TODO: nvim-ufo -> for folds
    "nvim-lua/plenary.nvim",
    "editorconfig/editorconfig-vim",
    { "numToStr/Comment.nvim", opts = {} },
    "tpope/vim-surround",
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            local bufferline = require("bufferline")
            bufferline.setup({
                options = {
                    mode = "tabs", -- "tabs" | "buffers" (default)
                    always_show_bufferline = false,
                    show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
                },
            })
        end,
    },
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
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        lazy = true,
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            file_types = { "markdown" },
            heading = {
                sign = false,
                icons = {},
            },
            code = {
                sign = false,
            },
            checkbox = {
                custom = {
                    todo = { raw = "[-]", rendered = "▣ ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
                },
            },
        },
        ft = { "markdown" },
    },
    {
        "mbbill/undotree",
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
    },
}
