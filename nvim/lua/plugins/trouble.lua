return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
        require("trouble").setup({
            modes = {
                diagnostics = {
                    auto_open = false,
                    auto_close = true,
                },
            },
        })
        local colors = {
            Normal = { bg = "NONE", fg = "#abb2bf" },
            -- Error = { bg = "#282c34", fg = "#e06c75" },
            -- Warning = { bg = "#282c34", fg = "#e5c07b" },
            -- Information = { bg = "#282c34", fg = "#56b6c2" },
            -- Hint = { bg = "#282c34", fg = "#c678dd" },
        }
        for name, color in pairs(colors) do
            vim.api.nvim_set_hl(0, "Trouble" .. name, color)
        end

        vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", {
            noremap = true,
            silent = true,
            desc = ":Trouble diagnostics toggle<CR> - Toggles the trouble diagnostics.",
        })

        vim.keymap.set("n", "<leader>xq", ":Trouble quickfix toggle<CR>", {
            noremap = true,
            silent = true,
            desc = ":Trouble quickfix toggle<CR> - Toggles the trouble quickfix.",
        })
    end,
}
