return {
    "hedyhli/outline.nvim",
    -- lazy = true,
    config = function()
        vim.keymap.set("n", "<leader>ol", ":Outline<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_hl(0, "OutlineBg", { bg = "#1e2030" })

        -- Setup outline with custom highlight
        require("outline").setup({
            outline_window = {
                winhl = "Normal:OutlineBg", -- Apply the OutlineBg highlight group to the Normal text in the outline window
            },
        })
    end,
}
