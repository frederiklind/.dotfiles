vim.cmd("let g:loaded_perl_provider = 0")
vim.cmd("let g:loaded_ruby_provider = 0")
vim.cmd("let g:vimtex_view_method = \'zathura\'")
vim.cmd("let g:vimtex_compiler_method = \'latexrun\'")
vim.cmd("let g:python3_host_prog = \'/usr/bin/python3\'")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set guicursor=n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff30000-blinkon250-Cursor/lCursor.")

vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.o.pumheight = 15

-- =============================== keymappings ==============================

vim.g.mapleader = " "
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = false, desc = ":w<CR> - Writes changes to the current active file" })
vim.keymap.set('n', '<C-q>', ':q<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-u>', ':u<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>sa', ':wa<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>wq', ':wqa<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>hs', ':split<CR>', { noremap = true, silent = true })

-- =============================== navigation ==============================
-- vim.keymap.set('n', '<S-p>', ':$<CR>', { noremap = true, silent = true, desc = ":$<CR> - Moves cursor to the end of the line." })
-- vim.keymap.set('n', '<S-o>', ':0<CR>', { noremap = true, silent = true, desc = ":0<CR> - Moves cursor to the beginning of the line." })

-- ============================ windows, buffers and tabs ===========================
--tabline
vim.keymap.set('n', '<F2>', ':set showtabline=2<CR>', { noremap = true, silent = true, desc = ":set showtabline=2<CR> - Shows the tabline." })
vim.keymap.set('n', '<F3>', ':set showtabline=0<CR>', { noremap = true, silent = true, desc = ":set showtabline=0<CR> - Hides the tabline." })

--tabs
vim.keymap.set('n', '<S-Tab>', ':tabnext<CR>', { noremap = true, silent = true, desc = ":tabnext<CR> - Navigate to next tab." })
vim.keymap.set('n', '<leader>tn', ':tabnew | Alpha<CR>', { noremap = true, silent = true, desc = ":tabnew<CR> - Creates a new tab." })
vim.keymap.set('n', '<leader>tq', ':tabclose<CR>', { noremap = true, silent = true, desc = ":tabclose<CR> - Closes the current active tab." })

-- windows
--nav
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { silent = true })


vim.keymap.set('n', '<S-Up', ':resize +2<CR>', { noremap = true, silent = true, desc = ":resize +2<CR> - Vertical resize current window." })
vim.keymap.set('n', '<S-Down>', ':resize -2<CR>', { noremap = true, silent = true, desc = ":resize -2<CR> - Vertical resize current window." })
vim.keymap.set('n', '<S-Left>', ':vertical resize +2<CR>', { noremap = true, silent = true, desc = ":vertical resize +2<CR> - Horizontal resize current window." })
vim.keymap.set('n', '<S-Right>', ':vertical resize -2<CR>', { noremap = true, silent = true, desc = ":vertical resize -2<CR> - Horizontal resize current window." })


-- buffers
vim.keymap.set('n', '<leader>p', ':bprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bf', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-f>', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, silent = true, desc = "Fuzzy finder within current buffer."})


-- ==================================== Telescope ===================================
vim.keymap.set('n', '<leader>cf', ':Telescope commands<CR>', { noremap = true, silent = false,  })

-- neo-tree
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true, desc = ":Neotree toggle<CR> - Toggles visibility of neo-tree." })
vim.keymap.set('n', '<leader>e', ':Neotree focus<CR>', { noremap = true, silent = true, desc = ":Neotree focus<CR> - Jump cursor to neo-tree." })

--git (neogit)
--vim.keymap.set('n', '<leader>gs', ':Neogit | Neotree git_status<CR>', { noremap = true, silent = true, desc = ":Neogit<CR> - Opens Neogit, for managing git changes and commits." })
--vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>gs', function()
  vim.cmd('Neogit')
  vim.cmd('Neotree git_status')
end, { noremap = true, silent = true, desc = "Opens Neogit, for managing git changes and commits." })


--git (diffview)
vim.keymap.set('n', '<leader>fh', ':DiffviewFileHistory<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>df', ':DiffviewFileHistory %<CR>', { noremap = true, silent = true })

--launch lazy/mason
vim.keymap.set('n', '<leader>lz', ':Lazy<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>mn', ':Mason<CR>', { noremap = true, silent = true })

--home-screen
vim.keymap.set('n', '<leader>hm', ':Alpha<CR>', { noremap = true, silent = true })


vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
