return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
        "VimEnter " .. vim.fn.expand("~") .. "/Notes/vault*", -- when opening neovim in the vault dir
        "DirChanged " .. vim.fn.expand("~") .. "/Notes/vault*", -- when changing dir to the vault dir
        -- "BufReadPre " .. vim.fn.expand("~") .. "/Notes/vault/**.md",
        -- "BufNewFile " .. vim.fn.expand("~") .. "/Notes/vault/**.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "notes",
                path = "~/Notes/vault",
            },
        },
        notes_subdir = "notes",
        daily_notes = {
            folder = "notes/dailies",
            date_format = "%Y_%m_%d__%H_%M_%S__%s",
            alias_format = "%B %-d, %Y at %H:%M:%S",
            template = nil,
        },
        note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            local suffix = ""
            if title ~= nil then
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.time()) .. "-" .. suffix
        end,
    },
}
