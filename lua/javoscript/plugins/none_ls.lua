return {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
    },
    config = function()
        require("mason-null-ls").setup({
            ensure_installed = {
                "stylua",
                "pint",
                "prettier",
                "markdownlint",
            },
            automatic_installation = true,
            handlers = {},
        })
        require("null-ls").setup({
            sources = {
                -- Anything not supported by mason.
            },
        })
    end,
}
