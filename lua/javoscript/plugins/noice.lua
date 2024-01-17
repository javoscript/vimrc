return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {
        lsp = {
            signature = { enabled = true, view = nil },
            hover = { enabled = true, view = nil },
            documentation = {
                view = "popup",
                opts = {
                    enter = false,
                    relative = "cursor",
                    position = {
                        row = 2,
                        col = 4,
                    },
                    border = { padding = { 0, 1 } },
                    size = {
                        width = "auto",
                        height = "auto",
                        max_height = 10,
                        max_width = 120,
                    },
                },
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = false,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = true,
        },
    },
}
