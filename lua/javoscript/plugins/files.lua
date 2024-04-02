return {
    {
        "kyazdani42/nvim-web-devicons",
    },
    -- {
    --
    --     "tamago324/lir.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "tamago324/lir-git-status.nvim",
    --     },
    --     config = function()
    --         local lir = require("lir")
    --         local actions = require("lir.actions")
    --         local clipboard_actions = require("lir.clipboard.actions")
    --         local mark_actions = require("lir.mark.actions")
    --
    --         lir.setup({
    --             hide_cursor = false,
    --             show_hidden_files = true,
    --             devicons = {
    --                 enable = true,
    --                 highlight_dirname = true,
    --             },
    --             mappings = {
    --                 ["<CR>"] = actions.edit,
    --                 ["l"] = actions.edit,
    --                 ["-"] = actions.up,
    --                 ["h"] = actions.up,
    --                 ["a"] = actions.newfile,
    --                 ["A"] = actions.mkdir,
    --                 ["r"] = actions.rename,
    --                 ["d"] = actions.delete,
    --                 ["."] = actions.toggle_show_hidden,
    --                 ["t"] = actions.tabedit,
    --                 ["s"] = actions.split,
    --                 ["v"] = actions.vsplit,
    --                 ["V"] = mark_actions.toggle_mark,
    --                 ["q"] = actions.quit,
    --                 ["<esc>"] = actions.quit,
    --                 ["y"] = actions.yank_path,
    --                 ["c"] = clipboard_actions.copy,
    --                 ["x"] = clipboard_actions.cut,
    --                 ["p"] = clipboard_actions.paste,
    --                 ["<C-j>"] = function()
    --                     vim.api.nvim_feedkeys("gj", "n", false)
    --                 end,
    --                 ["<C-k>"] = function()
    --                     vim.api.nvim_feedkeys("gk", "n", false)
    --                 end,
    --             },
    --             float = {
    --                 winblend = 0,
    --                 curdir_window = {
    --                     enable = true,
    --                     highlight_dirname = true,
    --                 },
    --                 win_opts = function()
    --                     local width = math.floor(vim.o.columns * 0.5)
    --                     local height = math.floor(vim.o.lines * 0.5)
    --                     return {
    --                         border = {
    --                             "┌",
    --                             "─",
    --                             "┐",
    --                             "│",
    --                             "┘",
    --                             "─",
    --                             "└",
    --                             "│",
    --                         },
    --                         width = width,
    --                         height = height,
    --                         row = math.floor((vim.o.lines - height) / 2),
    --                         col = math.floor((vim.o.columns - width) / 2),
    --                     }
    --                 end,
    --             },
    --         })
    --
    --         require("lir.git_status").setup({
    --             show_ignored = true,
    --         })
    --     end,
    -- },
    {
        "echasnovski/mini.files",
        version = "*",
        config = function()
            require("mini.files").setup({
                mappings = {
                    go_in = "<CR>",
                    go_in_plus = "L",
                    go_out = "",
                    go_out_plus = "H",
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
                    vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
                        vim.cmd(direction .. " split")
                        new_target_window = vim.api.nvim_get_current_win()
                    end)

                    MiniFiles.set_target_window(new_target_window)
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
