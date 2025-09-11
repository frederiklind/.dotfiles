return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local colors = require("colors.palette")
			local TelescopeColor = {

        -- match results highlight
				TelescopeMatching = {
          fg = colors.telescope_matching,
          bold = true,
        },

				TelescopeSelection = {
          fg = colors.telescope_selection_fg,
          bg = colors.telescope_selection_bg,
          bold = true,
        },

        TelescopePromptPrefix = {
          bg = colors.telescope_prompe_pf_bg,
          fg = colors.telescope_prompt_pf_fg,
        },

        TelescopePromptNormal = {
          bg = colors.telescope_prompt_norm_bg,
        },

        TelescopeResultsNormal = {
          fg = colors.telescope_results_norm_fg,
          bg = colors.telescope_results_norm_bg,
        },

        TelescopePreviewNormal = {
          bg = colors.telescope_preview_norm_bg,
        },

				TelescopePromptBorder = {
          bg = colors.telescope_prompt_border,
          fg = colors.telescope_prompt_border,
        },

        TelescopeResultsBorder = {
          bg = colors.telescope_results_border,
          fg = colors.telescope_results_border,
        },

        TelescopePreviewBorder = {
          bg = colors.telescope_preview_border,
          fg = colors.telescope_preview_border,
        },

        TelescopePromptTitle = {
          bg = colors.telescope_prompt_title_fg,
          fg = colors.telescope_prompt_title_bg,
          bold = true,
        },

        TelescopeResultsTitle = {
          fg = colors.telescope_results_title,
          bold = true,
        },

				TelescopePreviewTitle = {
          bg = colors.telescope_preview_title_bg,
          fg = colors.telescope_preview_title_fg,
          bold = true,
        },
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
            "-g",
            "!*.mp3",
            "-g",
            "!target",  -- Rust build dir
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
