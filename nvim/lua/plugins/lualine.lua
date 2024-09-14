return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin-macchiato",
				--theme = 'tokyonight'
				--theme = 'nord'
				section_separators = { left = "", right = "" },
				component_separators = { left = "╲", right = "╱" },
			},
		})
	end,
}
