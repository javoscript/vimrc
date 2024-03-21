-- plugins/rest.lua
return {
    "rest-nvim/rest.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    lazy = true,
    ft = "http",
    config = function()
        require("rest-nvim").setup({
            skip_ssl_verification = true,
        })
    end,
}
