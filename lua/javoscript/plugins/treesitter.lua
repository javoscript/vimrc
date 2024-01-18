return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
        -- "JoosepAlviste/nvim-ts-context-commentstring"        -- TODO: check if needed
        -- "nvim-treesitter/nvim-treesitter-refactor"           -- TODO: check if usefull - has highlight definition, highlight context, smart rename, navigation
    },
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = "all",
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
