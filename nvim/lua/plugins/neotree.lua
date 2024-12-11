return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },

  config = function()
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#181926" }) -- Crust background
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#181926" })
    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#1e2030", bg = "None" })
    vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { fg = "#181926", bg = "#181926" })

    -- vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" }) -- Crust background
    -- vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#181926", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { fg = "NONE", bg = "NONE" })

    require("neo-tree").setup({
      window = {
        position = "left",
        width = 35,
      },
      enable_git_status = true,
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added     = "A",
            deleted   = "D",
            modified  = "M",
            renamed   = "R",
            -- Status type
            untracked = "",
            ignored   = "",
            unstaged  = "",
            staged    = "",
            conflict  = "",
          }
        }
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
