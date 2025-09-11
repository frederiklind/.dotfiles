-- VSCode-like breadcrumbs line for visible buffers.

return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  config = function()
    require("barbecue").setup({
      theme = {
        normal = { bg = "NONE" }, -- no background for barbecue
      },
    })
  end,
}
