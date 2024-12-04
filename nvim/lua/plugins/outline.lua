return {
    "hedyhli/outline.nvim",
    -- lazy = true,
    config = function()
        vim.keymap.set("n", "<leader>ol", ":Outline<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_hl(0, "OutlineBg", { bg = "#181926" })

        -- Setup outline with custom highlight
        require("outline").setup({
            outline_window = {
                winhl = "Normal:OutlineBg",
            },
        })
    end,
}
