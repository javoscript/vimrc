return {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
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
    end
}
