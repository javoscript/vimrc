return {
    "tamago324/lir.nvim",
    dependencies = { "tamago324/lir-git-status.nvim" },
    config = function()
        local lir = require("lir")
        local actions = require("lir.actions")
        local clipboard_actions = require("lir.clipboard.actions")

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
                ["q"] = actions.quit,
                ["y"] = actions.yank_path,
                ["c"] = clipboard_actions.copy,
                ["x"] = clipboard_actions.cut,
                ["p"] = clipboard_actions.paste,
            },
            float = {
                winblend = 0,
                curdir_window = {
                    enable = false,
                    highlight_dirname = false,
                },
            },
        })

        require("lir.git_status").setup({
            show_ignored = true,
        })
    end,
}
