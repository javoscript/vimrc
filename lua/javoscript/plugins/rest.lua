return {
    {
        "jellydn/hurl.nvim",
        -- dev = true,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        ft = "hurl",
        opts = {
            debug = false,
            show_notification = false,
            mode = "split",
            formatters = {
                json = { 'jq' },
                html = {
                    'prettier', -- Make sure you have install prettier in your system, e.g: npm install -g prettier
                    '--parser',
                    'html',
                },
                xml = {
                    'tidy',
                    '-xml',
                    '-i',
                    '-q',
                },
            },
        },
        keys = {
            -- Run API request
            { "<leader>ii", "<cmd>HurlRunnerAt<CR>",         desc = "Run Api request" },
            { "<leader>il", "<cmd>HurlShowLastResponse<CR>", desc = "Run last response" },
            { "<leader>ie", "<cmd>HurlManageVariable<CR>",   desc = "Set env variable" },
            { "<leader>iI", "<cmd>HurlRunner<CR>",           desc = "Run All requests" },
            { "<leader>it", "<cmd>HurlRunnerToEntry<CR>",    desc = "Run Api request to entry" },
            { "<leader>im", "<cmd>HurlToggleMode<CR>",       desc = "Hurl Toggle Mode" },
            { "<leader>iv", "<cmd>HurlVerbose<CR>",          desc = "Run Api in verbose mode" },
            -- Run Hurl request in visual mode
            { "<leader>ii", ":HurlRunner<CR>",               desc = "Hurl Runner",             mode = "v" },
        },
    }
}
