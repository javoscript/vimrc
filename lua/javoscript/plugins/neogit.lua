return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim", -- optional - Diff integration
        "nvim-telescope/telescope.nvim",
    },
    config = {
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
}
