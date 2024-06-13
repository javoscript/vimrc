return {
    {
        "vhyrro/luarocks.nvim",
        dependencies = {
            { "nvim-neotest/nvim-nio" }
        },
        branch = "go-away-python",
        opts = {
            rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
        }
    },
    {
        "rest-nvim/rest.nvim",
        ft = "http",
        dependencies = {
            "luarocks.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("rest-nvim").setup({
                skip_ssl_verification = true, -- needed for local development tests without https
            })

            require("telescope").load_extension("rest")
        end,
    }
}
