return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "mason-org/mason.nvim", config = true },
            "mason-org/mason-lspconfig.nvim",
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
                            php = { "pint" },
                            markdown = { "injected", "markdownlint" },
                            html = { "rustywind", "prettier" }, -- eslint?
                            javascript = { "rustywind", "eslint_d" },
                            typescript = { "rustywind", "eslint_d" },
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
            local vue_language_server_path = vim.fn.exepath("vue-language-server")

            local servers = {
                lua_ls = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = false,
                        hint = { enable = true },
                    },
                },
                rust_analyzer = {},
                phpactor = {
                    capabilities = {
                        hoverProvider = false,
                        textDocument = {
                            hover = {},
                        },
                    },
                    init_options = {
                        ["language_server_worse_reflection.inlay_hints.enable"] = true,
                        ["language_server_worse_reflection.inlay_hints.params"] = true,
                        ["language_server_worse_reflection.inlay_hints.types"] = true,
                    },
                    handlers = {
                        ["textDocument/inlayHint"] = function(err, result, ...)
                            for _, res in ipairs(result) do
                                res.label = res.label .. ": "
                            end
                            vim.lsp.handlers["textDocument/inlayHint"](err, result, ...)
                        end,
                    },
                },
                intelephense = {
                    settings = {
                        intelephense = {
                            files = {
                                maxSize = 10000000,
                            },
                        },
                    },
                },
                tailwindcss = {},
                ts_ls = {
                    init_options = {
                        plugins = {
                            {
                                name = "@vue/typescript-plugin",
                                location = vue_language_server_path,
                                languages = { "vue" },
                            },
                        },
                    },
                    -- NOTE: To enable hybridMode, change HybrideMode to true in volar and uncomment the following filetypes block.
                    -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                        },
                    },
                },
                volar = {
                    root_dir = require("lspconfig").util.root_pattern(
                        "vue.config.js",
                        "vue.config.ts",
                        "nuxt.config.js",
                        "nuxt.config.ts"
                    ),
                    init_options = {
                        vue = {
                            hybridMode = false,
                        },
                    },
                    settings = {
                        typescript = {
                            inlayHints = {
                                enumMemberValues = {
                                    enabled = true,
                                },
                                functionLikeReturnTypes = {
                                    enabled = true,
                                },
                                propertyDeclarationTypes = {
                                    enabled = true,
                                },
                                parameterTypes = {
                                    enabled = true,
                                    suppressWhenArgumentMatchesName = true,
                                },
                                variableTypes = {
                                    enabled = true,
                                },
                            },
                        },
                    },
                },
            }

            require("mason").setup()
            require("mason-lspconfig").setup()

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            -- mason_lspconfig.setup_handlers({
            --     function(server_name)
            --         require("lspconfig")[server_name].setup({
            --             settings = servers[server_name],
            --             filetypes = (servers[server_name] or {}).filetypes,
            --         })
            --     end,
            -- })

            -- require("mason-lspconfig").setup({
            --     handlers = {
            --         function(server_name)
            --             local server = servers[server_name] or {}
            --
            --             server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            --
            --             require("lspconfig")[server_name].setup(server)
            --         end,
            --     },
            -- })

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
