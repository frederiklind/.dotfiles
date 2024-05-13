return {
    "nvim-neo-tree/neo-tree.nvim",
    --branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },

    config = function()
        require("neo-tree").setup({
            window = {
                position = "left",
                width = 35,
            },
            enable_git_status = true,
            git_status = {
                symbols = {
                    -- Change type
                    added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                    deleted = "✖ ", -- this can only be used in the git_status source
                    renamed = "󰁕 ", -- this can only be used in the git_status source
                    -- Status type
                    untracked = "",
                    ignored = "", --"",
                    unstaged = "󰄱 ",
                    staged = " ",
                    conflict = " ",
                },
            },

            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "",
                -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                -- then these will never be used.
                default = "",
                highlight = "NeoTreeFileIcon",
            },
            modified = {
                symbol = "",
                highlight = "NeoTreeModified",
            },
        })
    end,
}
