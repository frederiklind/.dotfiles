return {
	"nvim-lualine/lualine.nvim",
	config = function()
    
    local colors = require("colors.palette")

		require("lualine").setup({
			options = {
        theme = {
          normal = {
            a = { fg = colors.lualine_a_fg, bg = colors.lualine_a_bg_normal, gui = 'bold' },
            b = { fg = colors.lualine_b_fg, bg = colors.lualine_b_bg, gui = 'bold' },
            c = { fg = colors.lualine_c_fg, bg = colors.lualine_c_bg },
          },
          insert = {
            a = { fg = colors.lualine_a_fg, bg = colors.lualine_a_bg_insert, gui = 'bold' },
            b = { fg = colors.lualine_b_fg, bg = colors.lualine_b_bg, gui = 'bold' },
            c = { fg = colors.lualine_c_fg, bg = colors.lualine_c_bg },
          },
          command = {
            a = { fg = colors.lualine_a_fg, bg = colors.lualine_a_bg_command, gui = 'bold' },
            b = { fg = colors.lualine_b_fg, bg = colors.lualine_b_bg, gui = 'bold' },
            c = { fg = colors.lualine_c_fg, bg = colors.lualine_c_bg },
          },
          visual = {
            a = { fg = colors.lualine_a_fg, bg = colors.lualine_a_bg_visual, gui = 'bold' },
            b = { fg = colors.lualine_b_fg, bg = colors.lualine_b_bg, gui = 'bold' },
            c = { fg = colors.lualine_c_fg, bg = colors.lualine_c_bg },
          },
        },
				section_separators = { left = "", right = "" },
				component_separators = { left = "\\", right = "/" },
			},
		})
	end,
}
