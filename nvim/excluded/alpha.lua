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


-- local function configure()
--     local dashboard = require('alpha.themes.dashboard')
--
--     vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#DA4939" })
--     vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#FF875F" })
--     vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#FFC66D" })
--     vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#00FF03" })
--     vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#00AFFF" })
--     vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#8800FF" })
--
--     dashboard.section.header.type = "group"
--     dashboard.section.header.val = {
--         { type = "text", val = "   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ", opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" } },
--         { type = "text", val = "   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" } },
--         { type = "text", val = "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ", opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" } },
--         { type = "text", val = "   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ", opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" } },
--         { type = "text", val = "   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ", opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" } },
--         { type = "text", val = "   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ", opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" } },
--     }
--
--     dashboard.section.buttons.val = {
--         dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
--         dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
--         dashboard.button("g", "󰷾 " .. " Find text", ":Telescope live_grep <CR>"),
--         dashboard.button("b", " " .. " File browser", ":NvimTreeFocus <CR>"),
--         dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
--         dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
--         dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
--         dashboard.button("q", " " .. " Quit", ":qa<CR>"),
--     }
--
--     return dashboard.config
-- end
--
-- return {
--     "goolord/alpha-nvim",
--     lazy = true,
--     event = "VimEnter",
--     config = function(_, dashboard)
--         if vim.o.filetype == "lazy" then
--             vim.cmd.close()
--             vim.api.nvim_create_autocmd("User", {
--                 pattern = "AlphaReady",
--                 callback = function()
--                     require("lazy").show()
--                 end,
--             })
--         end
--
--         require('alpha').setup(configure())
--     end,
-- }
