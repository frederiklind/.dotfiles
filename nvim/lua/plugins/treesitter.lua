-- return {
--   "nvim-treesitter/nvim-treesitter",
--   build = ":TSUpdate",
--   opts = {
--     auto_install = true,
--     highlight = { enable = true },
--     indent = { enable = true },
--   },
-- }

--
-- return {
--   "nvim-treesitter/nvim-treesitter",
--   lazy = false,
--   build = ":TSUpdate",
--   config = function()
--     local ts = require("nvim-treesitter")
--
--     ts.setup {
--       ensure_installed = { "python", "c_sharp" },
--       highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = false,
--       },
--     }
--
--     -- manually start Tree-sitter only for Python
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = "python",
--       callback = function()
--         vim.treesitter.start()
--       end,
--     })
--
--     -- manually start Tree-sitter only for C#
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = "cs",
--       callback = function()
--         vim.treesitter.start()
--       end,
--     })
--   end,
-- }
--

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup {
      ensure_installed = { "python", "c_sharp", "sql" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }

    -- Python
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        vim.treesitter.start()
      end,
    })

    -- C#
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "cs",
      callback = function()
        vim.treesitter.start()
      end,
    })

    -- SQL
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "sql",
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
