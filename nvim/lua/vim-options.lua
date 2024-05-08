vim.cmd("let g:loaded_perl_provider = 0")
vim.cmd("let g:loaded_ruby_provider = 0")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.opt.wrap = false

vim.g.mapleader = " "

vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = false })        -- write file
vim.keymap.set('n', '<C-q>', ':q<CR>', { noremap = true, silent = false })        -- quit
vim.keymap.set('n', '<C-u>', ':u<CR>', { noremap = true, silent = false })        -- undo command
vim.keymap.set('n', '<leader>sa', ':wa<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>wq', ':wqa<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':split<CR>', { noremap = true, silent = true })

-- buffer resize command's
vim.keymap.set('n', '<S-Up', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Down>', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Left>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Right>', ':vertical resize -2<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })

-- neo-tree
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', ':Neotree focus<CR>', { noremap = true, silent = false })
