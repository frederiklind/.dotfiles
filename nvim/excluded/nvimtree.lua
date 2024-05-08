return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
    vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { silent = true })
  end,
}
