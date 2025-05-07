return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {
        lsp = {
            signature = { enabled = true },
            hover = { enabled = true },
        },
        messages = {
            view_search = "notify",
        },
        presets = {
            bottom_search = false,
            command_palette = true,
            long_message_to_split = true,
            -- inc_rename = false,
            -- lsp_doc_border = false,
        },
    },
}
