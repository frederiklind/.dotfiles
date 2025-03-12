return {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.gruvbox_material_transparent_background = 1
        vim.cmd.colorscheme("gruvbox-material")
    end,
}


-- return { 
--     "ellisonleao/gruvbox.nvim", 
--     priority = 1000 , 
--     config = function()
--         require("gruvbox").setup({
--             transparent_mode = true,
--         })
--         vim.cmd.colorscheme("gruvbox")
--     end,
-- }
