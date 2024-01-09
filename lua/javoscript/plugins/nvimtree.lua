return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            auto_reload_on_write = true,
            disable_netrw = true,
            hijack_netrw = true,
            hijack_cursor = false,
            hijack_unnamed_buffer_when_opening = false,
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            hijack_directories = {
                enable = true,
                auto_open = true,
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
                update_root = true,
                ignore_list = {},
            },
            view = {
                signcolumn = "yes",
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    webdev_colors = true,
                    glyphs = {
                        git = {
                            unstaged = "",
                            staged = "",
                            unmerged = "",
                            renamed = "",
                            deleted = "",
                            untracked = "",
                            ignored = "",
                            -- unstaged = "",
                            -- staged = "S",
                            -- unmerged = "",
                            -- renamed = "➜",
                            -- deleted = "",
                            -- untracked = "+",
                            -- ignored = "◌",
                        },
                    },
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            filters = {
                dotfiles = false,
                custom = {},
                exclude = {},
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 500,
            },
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- Default mappings. Feel free to modify or remove as you wish.
                api.config.mappings.default_on_attach(bufnr)

                -- Mappings migrated from view.mappings.list
                --
                -- You will need to insert "your code goes here" for any mappings with a custom action_cb
                vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
                vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
                vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
                vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
                vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
            end,
        })
    end,
}
