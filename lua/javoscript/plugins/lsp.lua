return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            {
                "stevearc/conform.nvim",
                config = function()
                    local slow_format_filetypes = { "vue", "javscript" }
                    require("conform").setup({
                        notify_on_error = true,
                        format_on_save = function(bufnr)
                            local disable_filetypes = { c = true, cpp = true }
                            if slow_format_filetypes[vim.bo[bufnr].filetype] then
                                return
                            end
                            local function on_format(err)
                                if err and err:match("timeout$") then
                                    slow_format_filetypes[vim.bo[bufnr].filetype] = true
                                end
                            end
                            return { timeout_ms = 200, lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype] },
                                on_format
                        end,
                        format_after_save = function(bufnr)
                            if not slow_format_filetypes[vim.bo[bufnr].filetype] then
                                return
                            end
                            return { lsp_fallback = true }
                        end,
                        formatters_by_ft = {
                            lua = { "stylua" },
                            php = { "pint", "php_cs_fixer" },
                            markdown = { "injected", "markdownlint" },
                            -- javascript = { "prettier", "rustywind", "eslint_d" },
                            -- vue = { "prettier", "rustywind", "eslint_d" },
                            javascript = { "rustywind", "eslint_d" },
                            vue = { "rustywind", "eslint_d" },
                            json = { "jq" },
                            yaml = { "prettier" },
                            gleam = { "gleam" },
                            -- Conform can also run multiple formatters sequentially
                            -- python = { "isort", "black" },
                            --
                            -- You can use a sub-list to tell conform to run *until* a formatter
                            -- is found.
                            -- javascript = { { "prettierd", "prettier" } },
                        },
                    })
                end,
            },
        },
        config = function()
            local servers = {
                lua_ls = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = false,
                    },
                },
                rust_analyzer = {},
                phpactor = {},
                volar = {},
                tailwindcss = {},
                tsserver = {},
                emmet_ls = {
                    filetypes = {
                        "css",
                        "eruby",
                        "html",
                        "javascript",
                        "javascriptreact",
                        "less",
                        "sass",
                        "scss",
                        "svelte",
                        "pug",
                        "typescriptreact",
                        "vue",
                        "blade", -- for .blade.php files
                    },
                },
            }

            require("mason").setup()
            require("mason-lspconfig").setup()

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers),
                automatic_installation = true,
            })

            mason_lspconfig.setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        settings = servers[server_name],
                        filetypes = (servers[server_name] or {}).filetypes,
                    })
                end,
            })
        end,
    },
    {
        "gbprod/phpactor.nvim",
        lazy = true,
        ft = { "php" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("phpactor").setup({
                install = {
                    -- path = vim.fn.stdpath("data") .. "/mason/packages/phpactor",
                    branch = "master",
                    bin = vim.fn.stdpath("data") .. "/mason/bin/phpactor",
                    php_bin = "php",
                    composer_bin = "composer",
                    git_bin = "git",
                    check_on_startup = "none",
                },
                lspconfig = {
                    enabled = false, -- NOTE: being handled via mason
                    options = {},
                },
            })
        end,
    },
}
