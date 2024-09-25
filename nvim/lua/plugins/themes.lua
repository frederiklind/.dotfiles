-- Neovim Colorthemes

return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            -- uncomment below to remove theme background color
            -- require("catppuccin").setup({
            --     transparent_background = true,
            -- })

            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
    },
    -- {
    --     "Mofiqul/vscode.nvim",
    --     lazy = false,
    --     name = "vscode",
    --     priority = 1000,
    --     config = function()
    --         vim.cmd.colorscheme("vscode")
    --     end,
    -- }
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     name = "tokyonight",
    --     priority = 1000,
    --     config = function()
    --         vim.cmd.colorscheme = "tokyonight"
    --     end,
    -- },
    -- {
    --     "shaunsingh/nord.nvim",
    --     config = function()
    --         --       vim.cmd.colorscheme "nord"
    --     end,
    -- },
}
