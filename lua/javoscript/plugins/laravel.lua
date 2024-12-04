return {
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "tpope/vim-dotenv",
            "nvim-telescope/telescope.nvim",
            "MunifTanjim/nui.nvim",
            "kevinhwang91/promise-async",
        },
        cmd = { "Laravel" },
        keys = {
            { "<leader>La", ":Laravel artisan<cr>" },
            { "<leader>Lc", ":Laravel commands<cr>" },
            { "<leader>Lo", ":Laravel routes<cr>" },
            { "<leader>Le", ":Laravel related<cr>" },
            { "<leader>Lr", ":Laravel resources<cr>" },
            { "<leader>Lh", ":Laravel history<cr>" },
        },
        event = { "VeryLazy" },
        config = function()
            local laravel = require("laravel")
            local get_line_indent = require("laravel.utils").get_line_indent
            local route_info_pos = "top"

            laravel.setup({
                features = {
                    route_info = {
                        enable = true,
                        view = route_info_pos,
                    },
                    model_info = {
                        enable = false,
                    },
                    override = {
                        enable = false,
                    },
                },
            })

            local route_info_view = {}

            if route_info_pos == "top" then
                function route_info_view:get(route, method)
                    local indent = get_line_indent(method.pos + 1)
                    local virt_lines = {
                        {
                            { indent .. "[ ", "comment" },
                            { table.concat(route.methods, "|"), "comment" },
                            { " ", "comment" },
                            { route.uri, "comment" },
                            { " ]", "comment" },
                        },
                    }

                    return {
                        virt_lines = virt_lines,
                        virt_lines_above = true,
                    }
                end
            end

            if route_info_pos == "right" then
                function route_info_view:get(route)
                    return {
                        virt_text = {
                            { "[ ", "comment" },
                            { table.concat(route.methods, "|"), "comment" },
                            { " ", "comment" },
                            { route.uri, "comment" },
                            { " ]", "comment" },
                        },
                    }
                end
            end

            local app = laravel.app
            app:instance("route_info_view", route_info_view)
        end,
    },
}
