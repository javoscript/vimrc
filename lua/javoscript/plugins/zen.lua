return {
    "folke/zen-mode.nvim",
    dependencies = {
        "b0o/incline.nvim",
    },
    opts = {
        plugins = {
            tmux = { enabled = false },
        },
        on_open = function()
            require("incline").disable()
        end,
        on_close = function()
            require("incline").enable()
        end,
    },
}
