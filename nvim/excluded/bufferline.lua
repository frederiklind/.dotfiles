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
                        filetype = "Neo-tree",
                        text = "",--"",
                        separator = true,
                        text_align = "center",
                    },
                },
                diagnostics = "nvim_lsp",
                separator_style = "slant",
                modified_icon = "●",
                show_close_icon = false,
                show_buffer_close_icons = false,
            },
        })
        vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<C-S-Tab>', ':bprev<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>c', ':bd<CR>', { noremap = true, silent = true })
    end,
}
