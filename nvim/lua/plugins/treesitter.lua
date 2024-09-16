return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				autoinstall = true,
				highlight = { enable = true },
				indent = { enable = true },
        -- autotag = { enable = true },
			})
		end,
	},
	-- {
	-- 	"windwp/nvim-ts-autotag", -- Install nvim-ts-autotag for auto-closing tags
	-- 	config = function()
	-- 		require("nvim-ts-autotag").setup()
	-- 	end,
	-- },
}
