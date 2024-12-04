local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.cmd('set laststatus=3')
vim.cmd("highlight VertSplit guifg=#181926 guibg=NONE")

require("vim-options")
require("lazy").setup("plugins")

vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#181926', bg = 'NONE' })
vim.opt.fillchars = { eob = " " }
