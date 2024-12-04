return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        -- uncomment below to remove theme background color
        require("catppuccin").setup({
            transparent_background = true,
        })
        vim.cmd.colorscheme("catppuccin-macchiato")
    end,
}
