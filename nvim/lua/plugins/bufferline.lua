return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    version = "*",
    config = function()
        vim.api.nvim_set_hl(
            0,
            "BufferLineFill",
            { bg = "#181926" }
        )

        vim.api.nvim_set_hl(
            0,
            "BufferLineSeparatorSelected",
            { fg = "#181926", bg = "#24273a" }
        )

        vim.api.nvim_set_hl(
            0,
            "BufferLineSeparatorVisible",
            { fg = "#181926", bg = "#1e2030" }
        )

        vim.api.nvim_set_hl(
            0,
            "BufferLineSeparator",
            { fg = "#181926", bg = "#181926" }
        )

        vim.api.nvim_set_hl(
            0,
            "BufferLineBufferVisible",
            {
                fg = "#cad3f5",
                bg = "#1e2030",
                bold = false,
                italic = false
            }
        )

        -- Non-selected buffers
        vim.api.nvim_set_hl(
            0,
            "BufferLineBackground",
            { fg = "#8087a2", bg = "#1e2030" }
        )

        -- Indicator for non-selected buffers
        vim.api.nvim_set_hl(
            0,
            "BufferLineIndicatorVisible",
            { fg = "#1e2030", bg = "#1e2030" }
        )

        -- vertical line left of selected buffer
        vim.api.nvim_set_hl(
            0,
            "BufferLineIndicatorSelected",
            { fg = "#24273a", bg = "#24273a" }
        )

        -- file tree offset
        vim.api.nvim_set_hl(
            0,
            "BufferLineSidebarOffset",
            { fg = "#494d64", bg = "#181926", bold = true }
        )

        require("bufferline").setup({

            options = {
                mode = "buffers", -- or "tabs"
                numbers = "none", -- "ordinal" | "buffer_id" | "both"

                indicator = {
                    style = "icon", -- can also be "underline" or "none"
                },
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "",
                        text_align = "center",
                        separator = false,
                        highlight = "BufferLineSidebarOffset",
                    },
                },
                buffer_close_icon = "",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                separator_style = "thin", -- "slant" | "thick" | "thin" | { 'left', 'right' }
                show_buffer_close_icons = false,
                show_close_icon = false,
                diagnostics = "nvim_lsp",
                always_show_bufferline = true,
            },
        })
    end,
}
