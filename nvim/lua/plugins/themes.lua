-- Neovim Colorthemes

return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            -- require("catppuccin").setup({
            --     transparent_background = true,
            -- })

            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        name = "tokyonight",
        priority = 1000,
        config = function()
            --        vim.cmd.colorscheme = "tokyonight"
        end,
    },
    {
        "shaunsingh/nord.nvim",
        config = function()
            --       vim.cmd.colorscheme "nord"
        end,
    },
}
