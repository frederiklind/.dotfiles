return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	config = function()
    vim.api.nvim_set_hl(0, "IblScope", { bg = "NONE", fg = "#363a4f" })

		require("ibl").setup({
			scope = {
				show_start = false,
        show_end = false,
        -- highlight = "Comment"
			},
			indent = {
				char = "▏",
				tab_char = "▏",
				smart_indent_cap = true,
			},
			whitespace = {
				remove_blankline_trail = true,
			},
		})
	end,
}
