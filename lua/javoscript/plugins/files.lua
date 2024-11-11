return {
    {
        "kyazdani42/nvim-web-devicons",
    },
    {
        "echasnovski/mini.files",
        version = "*",
        config = function()
            require("mini.files").setup({
                mappings = {
                    go_in = "L",
                    go_in_plus = "l",
                    go_out = "H",
                    go_out_plus = "h",
                    synchronize = "<Leader>w",
                },
                windows = {
                    preview = true,
                    width_focus = 50,
                    width_nofocus = 50,
                    width_preview = 50,
                },
            })

            local show_dotfiles = true
            local filter_show = function(fs_entry)
                return true
            end
            local filter_hide = function(fs_entry)
                return not vim.startswith(fs_entry.name, ".")
            end

            local toggle_dotfiles = function()
                show_dotfiles = not show_dotfiles
                local new_filter = show_dotfiles and filter_show or filter_hide
                require("mini.files").refresh({ content = { filter = new_filter } })
            end

            vim.api.nvim_create_autocmd("User", {
                pattern = "MiniFilesBufferCreate",
                callback = function(args)
                    local buf_id = args.data.buf_id
                    vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id, desc = "Toggle Hidden Files" })
                end,
            })

            local map_split = function(buf_id, lhs, direction)
                local rhs = function()
                    -- Make new window and set it as target
                    local new_target_window
                    vim.api.nvim_win_call(MiniFiles.get_explorer_state().target_window, function()
                        vim.cmd(direction .. " split")
                        new_target_window = vim.api.nvim_get_current_win()
                    end)

                    MiniFiles.set_target_window(new_target_window)
                    MiniFiles.go_in()
                    MiniFiles.close()
                end

                -- Adding `desc` will result into `show_help` entries
                local desc = "Split " .. direction
                vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
            end

            vim.api.nvim_create_autocmd("User", {
                pattern = "MiniFilesBufferCreate",
                callback = function(args)
                    local buf_id = args.data.buf_id
                    -- Tweak keys to your liking
                    map_split(buf_id, "gs", "belowright horizontal")
                    map_split(buf_id, "gv", "belowright vertical")
                end,
            })
        end,
    },
}
