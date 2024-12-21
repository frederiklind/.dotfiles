return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },

  config = function()
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#181926", bg = "None" })
    vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { fg = "NONE", bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = "#8aadf4", bg = "#181926" })
    vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = "#181926", bg = "#181926" })
    vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { fg = "#939ab7", bg = "#181926" })
    vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#363a4f", bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#a5adcb", bg = "NONE" })

    require("neo-tree").setup({
      window = {
        position = "left",
        width = 35,
      },

      enable_git_status = true,
      default_component_configs = {
        indent = {
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "╰",
          indent_size = 2,
        },
        git_status = {
          symbols = {
            added = "A",
            deleted = "D",
            modified = "M",
            renamed = "R",
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        components = {
          -- trunctate name of root node
          name = function(config, node, state)
            local components = require("neo-tree.sources.common.components")
            local name = components.name(config, node, state)
            if node:get_depth() == 1 then
              name.text = vim.fn.fnamemodify(name.text, ":t")
            end
            return name
          end,
        },
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        default = "",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = "",
        highlight = "NeoTreeModified",
      },
    })
  end,
}
