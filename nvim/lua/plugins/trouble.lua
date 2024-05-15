return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
        -- Setting up trouble.nvim
        require("trouble").setup({})

        -- Custom color configuration for Trouble
        local colors = {
            Normal = { bg = "#1e2030", fg = "#abb2bf" },
            -- Error = { bg = "#282c34", fg = "#e06c75" },
            -- Warning = { bg = "#282c34", fg = "#e5c07b" },
            -- Information = { bg = "#282c34", fg = "#56b6c2" },
            -- Hint = { bg = "#282c34", fg = "#c678dd" },
        }

        -- Apply the color settings
        for name, color in pairs(colors) do
            vim.api.nvim_set_hl(0, "Trouble" .. name, color)
        end
    end,
}
