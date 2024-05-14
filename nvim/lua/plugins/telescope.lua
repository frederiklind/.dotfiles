return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            local colors = require("catppuccin.palettes").get_palette()
            local TelescopeColor = {
                TelescopeMatching = { fg = colors.green },
                TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
                TelescopePromptPrefix = { bg = colors.surface0 },
                TelescopePromptNormal = { bg = colors.surface0 },
                TelescopeResultsNormal = { fg = colors.subtext0, bg = colors.mantle },
                TelescopePreviewNormal = { bg = colors.mantle },
                TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
                TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
                TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
                TelescopePromptTitle = { bg = colors.mauve, fg = colors.mantle },
                TelescopeResultsTitle = { fg = colors.mantle },
                TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
            }

            for hl, col in pairs(TelescopeColor) do
                vim.api.nvim_set_hl(0, hl, col)
            end

            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                defaults = {
                    prompt_prefix = "   ",
                    layout_strategy = "center",
                    results_title = false,
                    sorting_strategy = "ascending",
                    layout_config = {
                        prompt_position = "top", -- Set prompt position to top
                    },

                    extensions = {
                        ["ui-select"] = {
                            require("telescope.themes").get_dropdown({}),
                        },
                    },
                },

                pickers = {
                    find_files = {
                        previewer = false,
                    },
                    live_grep = {
                        layout_strategy = "horizontal",
                        previewer = true,
                    },
                    buffers = {
                        previewer = false,
                    },
                    current_buffer_fuzzy_find = {
                        previewer = false,
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
