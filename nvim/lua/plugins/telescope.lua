return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local colors = require("catppuccin.palettes").get_palette()
			local TelescopeColor = {
				-- TelescopeMatching = { fg = colors.green },
				-- TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
				-- TelescopePromptPrefix = { bg = colors.surface0, fg = colors.blue },
				-- TelescopePromptNormal = { bg = colors.surface0 },
				-- TelescopeResultsNormal = { fg = colors.subtext0, bg = colors.mantle },
				-- TelescopePreviewNormal = { bg = colors.mantle },
				-- TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
				-- TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
				-- TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
				-- TelescopePromptTitle = { bg = colors.blue, fg = colors.crust },
				-- TelescopeResultsTitle = { fg = colors.surface0 },
				-- TelescopePreviewTitle = { bg = colors.green, fg = colors.crust },

				TelescopeMatching = { fg = colors.green, bold = true },
				TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
				TelescopePromptPrefix = { bg = colors.base, fg = colors.blue },
				TelescopePromptNormal = { bg = colors.base },
				TelescopeResultsNormal = { fg = colors.subtext0, bg = colors.crust },
				TelescopePreviewNormal = { bg = colors.crust },
				TelescopePromptBorder = { bg = colors.base, fg = colors.base },
				TelescopeResultsBorder = { bg = colors.crust, fg = colors.crust },
				TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
				TelescopePromptTitle = { bg = colors.blue, fg = colors.crust, bold = true },
				TelescopeResultsTitle = { fg = colors.surface0 },
				TelescopePreviewTitle = { bg = colors.green, fg = colors.crust, bold = true },
			}

			for hl, col in pairs(TelescopeColor) do
				vim.api.nvim_set_hl(0, hl, col)
			end
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"-g",
						"!.git",
						"-g",
						"!node_modules",
						"-g",
						"!*.png",
						"-g",
						"!*.jpg",
						"-g",
						"!*.jpeg",
						"-g",
						"!*.gif",
						"-g",
						"!*.ico",
					},
				})
			end, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>km", builtin.keymaps, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = "   ",
					layout_strategy = "vertical",
					results_title = false,
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
					},

					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown({}),
						},
					},
				},

				pickers = {
					find_files = {
						-- previewer = false,
						height = 0.5,
						layout_strategy = "horizontal",
					},
					live_grep = {
						layout_strategy = "horizontal",
						previewer = true,
					},
					buffers = {
						previewer = false,
					},
					current_buffer_fuzzy_find = {
						previewer = false,
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
