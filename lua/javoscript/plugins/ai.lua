return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    lazy = false,
    build = "make",
    opts = {
        provider = "claude",
        auto_suggestions_provider = "claude",
        cursor_applying_provider = nil, -- The provider used in the applying phase of Cursor Planning Mode, defaults to nil, when nil uses Config.provider as the provider for the applying phase
        claude = {
            endpoint = "https://api.anthropic.com",
            temperature = 0,
            -- max_tokens = 4096,
        },
        windows = {
            sidebar_header = { rounded = false },
            input = { height = 3 },
            ask = { start_instert = false },
        },
        hints = { enabled = true },
        rag_service = { enabled = false }, -- Enables the rag service, requires OPENAI_API_KEY to be set
        behaviour = {
            auto_suggestions = false,
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = true,
            minimize_diff = true,
            enable_token_counting = true,
            enable_cursor_planning_mode = false, -- Whether to enable Cursor Planning Mode. Default to false.
            enable_claude_text_editor_tool_mode = false, -- Whether to enable Claude Text Editor Tool Mode.
        },
        dual_boost = {
            enabled = false,
            first_provider = "openai",
            second_provider = "claude",
            prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
            timeout = 60000, -- Timeout in milliseconds
        },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-tree/nvim-web-devicons",
        "hrsh7th/nvim-cmp",
        --- The below dependencies are optional,
        -- "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            lazy = false,
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
