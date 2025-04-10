return {
    "lervag/vimtex",
    ft = "tex",  -- Lazy-load only for .tex files
    config = function()
        vim.api.nvim_set_keymap("n", "<leader>ll", "<Plug>(vimtex-compile)", {})
        vim.g.vimtex_view_method = 'zathura'
        vim.g.vimtex_compiler_method = 'latexmk'
    end,
}
