return {
    "hedyhli/outline.nvim",
    --lazy = true,
    config = function()
        -- Example mapping to toggle outline
        vim.keymap.set("n", "<leader>o", ":Outline<CR>", { noremap = true, silent = true })

        require("outline").setup({
            -- Your setup opts here (leave empty to use defaults)
        })
    end,
}
