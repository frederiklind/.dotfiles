return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
    dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dapui").setup()

			-- dotnet debugging (csharp, fsharp)
			dap.adapters.coreclr = {
				type = "executable",
				command = "/usr/bin/netcoredbg",
				args = { "--interpreter=vscode" },
			}

			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "launch - netcoredbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
					end,
				},
			}

			-- -------------------- Debuf for go ----------------------------

			require("dap-go").setup()

			-- -------------------- Debug for python -------------------------

			require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
			dap.adapters.python = {
				type = "executable",
				command = os.getenv("HOME") .. "/.virtualenvs/tools/bin/python",
				args = { "-m", "debugpy.adapter" },
			}

			-- ---------------------------------------------------------------

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			--change symbols
			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapLogPoint",
				{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
			)
			vim.fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
			)

			-- vim.keymap.set(
			--     "n",
			--     "<leader>sd",
			--     dap.toggle_breakpoint,
			--     { noremap = true, silent = true, desc = "Toggles breakpoint on/off for current line." }
			-- )
			vim.keymap.set("n", "<leader>dc", dap.continue, { noremap = true, silent = true, desc = "Continue" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
    lazy = true,
	},
	{
		"nvim-neotest/nvim-nio",
        lazy = true,
	},
	{
		"Weissle/persistent-breakpoints.nvim",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("persistent-breakpoints").setup({
				save_dir = vim.fn.stdpath("data") .. "/nvim_checkpoints",
				load_breakpoints_event = { "BufReadPost" },
				perf_record = false,
			})
			vim.keymap.set("n", "<leader>sd", function()
				require("persistent-breakpoints.api").toggle_breakpoint()
			end, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>tr", function()
				require("persistent-breakpoints.api").clear_all_breakpoints()
			end, { noremap = true, silent = true })
		end,
	},
}
