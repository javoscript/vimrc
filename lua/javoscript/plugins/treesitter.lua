return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        {
            "nvim-treesitter/nvim-treesitter-context",
            lazy = true,
            opts = { enable = false },
        },
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

        vim.treesitter.language.register("php", "blade")
    end,
}
