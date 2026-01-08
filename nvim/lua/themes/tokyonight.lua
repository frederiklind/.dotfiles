return {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokyonight",
    priority = 1000,
    config = function()
        -- uncomment below to remove theme background color
        require("tokyonight").setup({
            transparent_background = true,
        })
        vim.cmd.colorscheme("tokyonight-storm")
    end,
}
