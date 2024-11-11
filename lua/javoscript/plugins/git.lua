return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = {
                        text = "▮",
                    },
                    change = {
                        text = "▮",
                    },
                    delete = {
                        text = "▮",
                    },
                    topdelete = {
                        text = "‾",
                    },
                    changedelete = {
                        text = "▮",
                    },
                    untracked = {
                        text = "▮",
                    },
                },
                signcolumn = true,
                numhl = false,
                linehl = false,
            })
        end,
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/popup.nvim", -- TODO: check if needed
            {
                "sindrets/diffview.nvim",
                config = function()
                    local actions = require("diffview.actions")
                    require("diffview").setup({
                        keymaps = {
                            view = {
                                {
                                    "n",
                                    "<leader>gco",
                                    actions.conflict_choose("ours"),
                                    { desc = "Choose the OURS version of a conflict" },
                                },
                                {
                                    "n",
                                    "<leader>gct",
                                    actions.conflict_choose("theirs"),
                                    { desc = "Choose the THEIRS version of a conflict" },
                                },
                                {
                                    "n",
                                    "<leader>gcb",
                                    actions.conflict_choose("base"),
                                    { desc = "Choose the BASE version of a conflict" },
                                },
                                {
                                    "n",
                                    "<leader>gca",
                                    actions.conflict_choose("all"),
                                    { desc = "Choose all the versions of a conflict" },
                                },
                                {
                                    "n",
                                    "<leader>gdx",
                                    actions.conflict_choose("none"),
                                    { desc = "Delete the conflict region" },
                                },
                                {
                                    "n",
                                    "<leader>gcO",
                                    actions.conflict_choose_all("ours"),
                                    { desc = "Choose the OURS version of a conflict for the whole file" },
                                },
                                {
                                    "n",
                                    "<leader>gcT",
                                    actions.conflict_choose_all("theirs"),
                                    { desc = "Choose the THEIRS version of a conflict for the whole file" },
                                },
                                {
                                    "n",
                                    "<leader>gcB",
                                    actions.conflict_choose_all("base"),
                                    { desc = "Choose the BASE version of a conflict for the whole file" },
                                },
                                {
                                    "n",
                                    "<leader>gcA",
                                    actions.conflict_choose_all("all"),
                                    { desc = "Choose all the versions of a conflict for the whole file" },
                                },
                                {
                                    "n",
                                    "<leader>gdX",
                                    actions.conflict_choose_all("none"),
                                    { desc = "Delete the conflict region for the whole file" },
                                },
                            },
                        },
                    })
                end,
            },
        },

        opts = {
            disable_hint = true,
            process_spinner = false,
            commit_editor = {
                kind = "auto",
            },
            graph_style = "unicode",
            sections = {
                recent = {
                    folded = false,
                },
            },
            mappings = {
                finder = {
                    ["<c-j>"] = "Next",
                    ["<c-k>"] = "Previous",
                },
            },
        },
    },
}
