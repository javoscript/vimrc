return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup({
                exclude = {
                    filetypes = {
                        "help",
                        "startify",
                        "dashboard",
                        "packer",
                        "neogitstatus",
                        "NvimTree",
                        "Trouble",
                    },
                    buftypes = {
                        "terminal",
                        "nofile",
                    },
                },
            })
        end,
    },
    {
        "echasnovski/mini.indentscope",
        version = "*",
        config = function()
            require("mini.indentscope").setup({
                -- draw = {
                --     animation = require('mini.indentscope').gen_animation.none()
                -- }
            })
        end,
    },
}
