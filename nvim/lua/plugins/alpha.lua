return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		vim.cmd("highlight CustomHeaderColor guifg=#8aadf4")

		dashboard.section.header.val = {
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[]],
			[[]],
		}

		dashboard.section.header.opts = {
			hl = "CustomHeaderColor",
			position = "center",
			width = 100, -- Adjust this width as needed to ensure centering
			shrink_margin = false,
		}

		alpha.setup(dashboard.opts)
	end,
}
