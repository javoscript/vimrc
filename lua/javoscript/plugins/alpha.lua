return {
    "goolord/alpha-nvim",
    config = function ()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[ 🚀 javoscript 🚀 ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("f", "🔎  Find file", ":Telescope git_files <CR>"),
            dashboard.button("e", "📄  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("p", "📁  Find project", ":Telescope projects <CR>"),
            dashboard.button("r", "🕘  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("t", "🔤  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "🔨  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
            dashboard.button("q", "🏃  Quit Neovim", ":qa<CR>"),
        }

        local function footer()
            return "javoscript.com 🔗"
        end

        dashboard.section.footer.val = footer()

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end
}
