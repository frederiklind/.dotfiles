return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				-- theme = "catppuccin-macchiato",
        theme = {
          normal = {
            a = { fg = '#181926', bg = '#8aadf4', gui = 'bold' },
            b = { fg = '#8aadf4', bg = '#24273a', gui = 'bold' },
            c = { fg = '#6e738d', bg = '#181926' },
          },
          insert = {
            a = { fg = '#181926', bg = '#8bd5ca', gui = 'bold' },
            b = { fg = '#8aadf4', bg = '#24273a', gui = 'bold' },
            c = { fg = '#6e738d', bg = '#181926' },
          },
          command = {
            a = { fg = '#181926', bg = '#fab387', gui = 'bold' },
            b = { fg = '#8aadf4', bg = '#24273a', gui = 'bold' },
            c = { fg = '#6e738d', bg = '#181926' },
          },
          visual = {
            a = { fg = '#181926', bg = '#cba6f7', gui = 'bold' },
            b = { fg = '#8aadf4', bg = '#24273a', gui = 'bold' },
            c = { fg = '#6e738d', bg = '#181926' },
          },
        },
				section_separators = { left = "", right = "" },
				component_separators = { left = "╲", right = "╱" },
			},
		})
	end,
}
