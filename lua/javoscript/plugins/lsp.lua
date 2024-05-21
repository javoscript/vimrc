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
                            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                                return
                            end
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
                            php = { "php_cs_fixer", "pint" },
                            markdown = { "injected", "markdownlint" },
                            javascript = { "rustywind", "eslint_d" },
                            typescript = { "rustywind", "eslint_d" },
                            html = { "rustywind", "prettier" }, -- eslint?
                            vue = { "rustywind", "eslint_d" },
                            json = { "prettier" },
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

                    vim.api.nvim_create_user_command("FormatDisable", function(args)
                        if args.bang then
                            -- FormatDisable! will disable formatting just for this buffer
                            vim.b.disable_autoformat = true
                        else
                            vim.g.disable_autoformat = true
                        end
                    end, {
                        desc = "Disable autoformat-on-save",
                        bang = true,
                    })
                    vim.api.nvim_create_user_command("FormatEnable", function()
                        vim.b.disable_autoformat = false
                        vim.g.disable_autoformat = false
                    end, {
                        desc = "Re-enable autoformat-on-save",
                    })
                end,
            },
        },
        config = function()
            local mason_registry = require("mason-registry")
            local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
                .. "/node_modules/@vue/language-server"

            local servers = {
                lua_ls = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = false,
                    },
                },
                rust_analyzer = {},
                phpactor = {},
                tailwindcss = {},
                tsserver = {
                    init_options = {
                        plugins = {
                            {
                                name = "@vue/typescript-plugin",
                                location = vue_language_server_path,
                                languages = {
                                    "typescript",
                                    "javascript",
                                    "javascriptreact",
                                    "typescriptreact",
                                    "vue",
                                },
                            },
                        },
                    },
                    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                },
                volar = {},
                -- emmet_ls = {
                --     filetypes = {
                --         "css",
                --         "eruby",
                --         "html",
                --         "javascript",
                --         "javascriptreact",
                --         "less",
                --         "sass",
                --         "scss",
                --         "svelte",
                --         "pug",
                --         "typescriptreact",
                --         "vue",
                --         "blade", -- for .blade.php files
                --     },
                -- },
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

            require("lspconfig").gleam.setup({})
        end,
    },
    {
        "phpactor/phpactor",
        lazy = true,
        ft = { "php", "blade" },
        build = "composer install --no-dev -o",
    },
}
