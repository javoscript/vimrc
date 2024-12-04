return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     vim.cmd([[colorscheme duskfox]])
        --     vim.cmd([[hi DiagnosticUnderlineWarn cterm=underline gui=underline]])
        --     vim.cmd([[hi DiagnosticUnderlineError cterm=underline gui=underline]])
        --     vim.cmd([[hi DiagnosticUnderlineHint cterm=underline gui=underline]])
        --     vim.cmd([[hi DiagnosticUnderlineInfo cterm=underline gui=underline]])
        --     vim.cmd([[hi DiagnosticUnderlineOk cterm=underline gui=underline]])
        -- end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                integrations = {
                    mini = {
                        enabled = true,
                        indentscope_color = "blue",
                    },
                    indent_blankline = {
                        enabled = false,
                    },
                    harpoon = true,
                    noice = true,
                    dadbod_ui = true,
                    which_key = true,
                    mason = true,
                },
            })
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
}
