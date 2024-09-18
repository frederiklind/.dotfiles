return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.api.nvim_set_keymap("n", "<leader>ll", "<Plug>(vimtex-compile)", {})
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'
	end,
}
