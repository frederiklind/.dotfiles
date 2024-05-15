return {
	"jpalardy/vim-slime", -- The vim-slime plugin
	config = function()
		vim.g.slime_target = "tmux"
		vim.g.slime_default_config = { socket_name = "default", target_pane = "{right-of}" }
		vim.g.slime_paste_file = vim.fn.expand("$HOME/.slime_paste")
		vim.keymap.set("n", "<leader>fs", ":SlimeSend<CR>", { noremap = true, silent = true })
		vim.keymap.set("v", "<leader>fs", ":SlimeSend<CR>", { noremap = true, silent = true })
	end,
}
