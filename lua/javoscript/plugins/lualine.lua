return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "folke/noice.nvim",
    },
    config = function()
        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = " ", warn = " " },
            colored = true,
            update_in_insert = false,
            always_visible = true,
        }

        local diff = {
            "diff",
            colored = true,
            symbols = { added = " ", modified = " ", removed = " " },
        }

        local mode = {
            "mode",
            fmt = function(str)
                return "-- " .. str .. " --"
            end,
        }

        local filetype = {
            "filetype",
            icons_enabled = true,
            icon = nil,
        }

        local branch = {
            "branch",
            icons_enabled = true,
            colored = true,
            icon = "",
        }

        local spaces = function()
            return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end

        local lsps = function()
            return "(" .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients())) .. ")"
        end

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                globalstatus = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { branch, diff, diagnostics },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = {
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                    spaces,
                    "encoding",
                    filetype,
                    lsps,
                },
                lualine_y = { "location" },
                lualine_z = { "progress" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {
                lualine_a = {
                    {
                        "tabs",
                        mode = 2,
                        path = 1,
                    },
                },
            },
            extensions = {},
        })

        vim.opt.showtabline = 1 -- NOTE: workaround because it is being overriden by lualine
    end,
}
