
return {
    "hedyhli/outline.nvim",
    -- lazy = true,  -- Uncomment this if you want to lazy load
    config = function()
        -- Set keymapping for opening outline
        vim.keymap.set("n", "<leader>o", ":Outline<CR>", { noremap = true, silent = true })

        -- Define custom highlight for the outline window background
        vim.api.nvim_set_hl(0, "OutlineBg", { bg = "#1e2030" })

        -- Setup outline with custom highlight
        require("outline").setup({
            outline_window = {
                winhl = "Normal:OutlineBg",  -- Apply the OutlineBg highlight group to the Normal text in the outline window
            },
        })
    end
}
