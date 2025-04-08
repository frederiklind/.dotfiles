return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },

    config = function()
        local colors = require("colors.palette")

        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = colors.neotree_normal })
        -- vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = colors.neotree_normal })
        vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = colors.neotree_win_sep, bg = colors.neotree_win_sep })
        vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { fg = "NONE", bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = colors.neotree_tile_bar_fg, bg = colors.neotree_tile_bar_bg })
        vim.api.nvim_set_hl(
            0,
            "NeoTreeFloatBorder",
            { fg = colors.neotree_float_border, bg = colors_neotree_float_border }
        )
        vim.api.nvim_set_hl(
            0,
            "NeoTreeFloatTitle",
            { fg = colors.neotree_float_title_fg, bg = colors.neotree_float_title_bg }
        )
        vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = colors.neotree_indent_marker, bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = colors.neotree_file_name, bg = "NONE" })

        require("neo-tree").setup({
            window = {
                position = "left",
                width = 35,
            },

            enable_git_status = true,
            default_component_configs = {
                indent = {
                    with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "╰",
                    indent_size = 2,
                    -- with_expanders = true, -- ← this is the correct key
                    -- expander_collapsed = "", -- Chevron right
                    -- expander_expanded = "",  -- Chevron down
                    -- expander_highlight = "NeoTreeExpander",
                },
                git_status = {
                    symbols = {
                        added = "A",
                        deleted = "D",
                        modified = "M",
                        renamed = "R",
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                components = {
                    -- trunctate name of root node
                    name = function(config, node, state)
                        local components = require("neo-tree.sources.common.components")
                        local name = components.name(config, node, state)
                        if node:get_depth() == 1 then
                            name.text = vim.fn.fnamemodify(name.text, ":t")
                        end
                        return name
                    end,
                },
            },
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "",
                default = "",
                highlight = "NeoTreeFileIcon",
            },
            modified = {
                symbol = "",
                highlight = "NeoTreeModified",
            },
            hide_root_node = false,
            retain_hidden_root_indent = true,
            -- add_blank_line_at_top = true,
            -- close_if_last_window = true,
        })
    end,
}
