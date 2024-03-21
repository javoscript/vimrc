return {
    "tamago324/lir.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "tamago324/lir-git-status.nvim",
        "kyazdani42/nvim-web-devicons",
    },
    config = function()
        local lir = require("lir")
        local actions = require("lir.actions")
        local clipboard_actions = require("lir.clipboard.actions")
        local mark_actions = require("lir.mark.actions")

        lir.setup({
            hide_cursor = false,
            show_hidden_files = true,
            devicons = {
                enable = true,
                highlight_dirname = false,
            },
            mappings = {
                ["<CR>"] = actions.edit,
                ["l"] = actions.edit,
                ["-"] = actions.up,
                ["h"] = actions.up,
                ["a"] = actions.newfile,
                ["A"] = actions.mkdir,
                ["r"] = actions.rename,
                ["d"] = actions.delete,
                ["."] = actions.toggle_show_hidden,
                ["t"] = actions.tabedit,
                ["s"] = actions.split,
                ["v"] = actions.vsplit,
                ["V"] = mark_actions.toggle_mark,
                ["q"] = actions.quit,
                ["y"] = actions.yank_path,
                ["c"] = clipboard_actions.copy,
                ["x"] = clipboard_actions.cut,
                ["p"] = clipboard_actions.paste,
            },
            float = {
                winblend = 0,
                curdir_window = {
                    enable = true,
                    highlight_dirname = true,
                },
                win_opts = function()
                    local width = math.floor(vim.o.columns * 0.5)
                    local height = math.floor(vim.o.lines * 0.5)
                    return {
                        border = {
                            "┌",
                            "─",
                            "┐",
                            "│",
                            "┘",
                            "─",
                            "└",
                            "│",
                        },
                        width = width,
                        height = height,
                        row = math.floor((vim.o.lines - height) / 2),
                        col = math.floor((vim.o.columns - width) / 2),
                    }
                end,
            },
        })

        require("lir.git_status").setup({
            show_ignored = true,
        })
    end,
}
