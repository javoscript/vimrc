return {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",                -- TODO: check if needed
    "editorconfig/editorconfig-vim",
    -- "tpope/vim-fugitive",                -- TODO
    { "numToStr/Comment.nvim", opts = {} },
    -- { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } } -- TODO: see if better tree
    -- "nvim-lualine/lualine.nvim"          -- TODO: see if better status line
    -- "akinsho/toggleterm.nvim"            -- TODO: see if useful
    -- "ahmedkhalf/project.nvim"            -- TODO: see if useful
    "tpope/vim-surround",
    "mg979/vim-visual-multi",
    { "folke/which-key.nvim", opts = {} },  -- TODO: check if needed
    -- "antoinemadec/FixCursorHold.nvim"    -- TODO: This is needed to fix lsp doc highlight
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
        end
    },
    { "aserowy/tmux.nvim", opts = {} },
    { "folke/zen-mode.nvim", opts = {} },
    {
        "vim-test/vim-test",
        config = function()
            vim.cmd([[
                let g:test#strategy = 'neovim'
                let test#neovim#term_position = "vert"
                " let g:test#neovim#start_normal = 1
            ]])
        end
    }
    -- { "simrat39/symbols-outline.nvim", opts = {} }       -- TODO: replace it with a "symbols" finder in telescope?
}
