return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup({
            options = {
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "",--"",
                        separator = true,
                        text_align = "center",
                    },
                },
                diagnostics = "nvim_lsp",
                separator_style = "slope",
                modified_icon = "●",
                show_close_icon = false,
                show_buffer_close_icons = false,
            },
        })
    end,
}
