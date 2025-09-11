-- Auto-close of html tags,
-- for a streamlined experience, that will make you
-- not wanting to blow your own head off :-)

return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				-- Defaults
				enable_close = true,           -- Auto close tags
				enable_rename = true,          -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
		})
	end,
}
