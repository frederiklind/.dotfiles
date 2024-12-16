vim.cmd("let g:loaded_perl_provider = 0")
vim.cmd("let g:loaded_ruby_provider = 0")
vim.cmd("let g:python3_host_prog = '/usr/bin/python3'")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set guicursor=n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff30000-blinkon250-Cursor/lCursor.")
vim.cmd("set termguicolors")


vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 15
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.o.pumheight = 15
vim.g.mapleader = " "
vim.o.showmode = false
vim.o.showcmd = false

vim.keymap.set('n', '<S-h>', '^', { noremap = true, silent = true })
vim.keymap.set('n', '<S-l>', '$', { noremap = true, silent = true })


vim.keymap.set(
    { "n", "i" },
    "<C-s>",
    ":w<CR>",
    { noremap = true, silent = false, desc = ":w<CR> - Writes changes to the current active file" }
)
vim.keymap.set(
    "n",
    "<C-q>",
    ":q<CR>",
    { noremap = true, silent = false, desc = ":q<CR> - Quits the current active file" }
)
vim.keymap.set(
    "n",
    "<leader>wq",
    ":wqa<CR>",
    { noremap = true, silent = false, desc = ":wqa<CR> - Writes changes to all files and quits." }
)
vim.keymap.set(
    "n",
    "<leader>wr",
    ":set wrap! linebreak!<CR>",
    { noremap = true, silent = true, desc = ":set wrap!<CR> - Toggles text wrapping." }
)

-- awesomeness right here
vim.keymap.set(
    "x",
    "<leader>p",
    '"_dP)',
    { noremap = true, silent = true, desc = "Pastes without yanking. (when replacing in visual mode)" }
)
vim.keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { noremap = true, silent = true, desc = "Search and replace word under cursor." }
)

-- ============================ windows, buffers and tabs ===========================
--tabline
vim.keymap.set(
    "n",
    "<F2>",
    ":set showtabline=2<CR>",
    { noremap = true, silent = true, desc = ":set showtabline=2<CR> - Shows the tabline." }
)
vim.keymap.set(
    "n",
    "<F3>",
    ":set showtabline=0<CR>",
    { noremap = true, silent = true, desc = ":set showtabline=0<CR> - Hides the tabline." }
)

--tabs
vim.keymap.set(
    "n",
    "<S-Tab>",
    ":tabnext<CR>",
    { noremap = true, silent = true, desc = ":tabnext<CR> - Navigate to next tab." }
)
vim.keymap.set(
    "n",
    "<leader>tn",
    ":tabnew | Alpha<CR>",
    { noremap = true, silent = true, desc = ":tabnew<CR> - Creates a new tab." }
)
vim.keymap.set(
    "n",
    "<leader>tq",
    ":tabclose<CR>",
    { noremap = true, silent = true, desc = ":tabclose<CR> - Closes the current active tab." }
)

-- windows
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true, desc = ":wincmd k<CR> - Move to window above." })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true, desc = ":wincmd j<CR> - Move to window below." })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true, desc = ":wincmd h<CR> - Move to window on the left." })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true, desc = ":wincmd l<CR> - Move to window on the right." })
vim.keymap.set(
    "n",
    "<S-Up",
    ":resize +2<CR>",
    { noremap = true, silent = true, desc = ":resize +2<CR> - Vertical resize current window." }
)
vim.keymap.set(
    "n",
    "<S-Down>",
    ":resize -2<CR>",
    { noremap = true, silent = true, desc = ":resize -2<CR> - Vertical resize current window." }
)
vim.keymap.set(
    "n",
    "<S-Left>",
    ":vertical resize +2<CR>",
    { noremap = true, silent = true, desc = ":vertical resize +2<CR> - Horizontal resize current window." }
)
vim.keymap.set(
    "n",
    "<S-Right>",
    ":vertical resize -2<CR>",
    { noremap = true, silent = true, desc = ":vertical resize -2<CR> - Horizontal resize current window." }
)

-- buffers
vim.keymap.set(
    "n",
    "<leader>p",
    ":bprev<CR>",
    { noremap = true, silent = true, desc = ":bprev<CR> - Navigate to previous buffer." }
)
vim.keymap.set(
    "n",
    "<leader>n",
    ":bnext<CR>",
    { noremap = true, silent = true, desc = ":bnext<CR> - Navigate to next buffer." }
)
vim.keymap.set(
    "n",
    "<leader>bd",
    ":bd<CR>",
    { noremap = true, silent = true, desc = ":bd<CR> - Close current buffer." }
)
vim.keymap.set("n", "<leader>bp", ":bp<CR>", { noremap = true, silent = true, desc = ":bp<CR> - Previous buffer." })

-- telescope
vim.keymap.set(
    "n",
    "<leader>cf",
    ":Telescope commands<CR>",
    { noremap = true, silent = false, desc = ":Telescope commands<CR> - Fuzzy finder for commands." }
)
vim.keymap.set(
    "n",
    "<S-f>",
    ":Telescope current_buffer_fuzzy_find<CR>",
    { noremap = true, silent = true, desc = "Fuzzy finder within current buffer." }
)
vim.keymap.set(
    "n",
    "<leader>bf",
    ":Telescope buffers<CR>",
    { noremap = true, silent = true, desc = ":Telescope buffers<CR> - Fuzzy finder for buffers." }
)

-- neo-tree
vim.keymap.set(
    "n",
    "<C-n>",
    ":Neotree toggle<CR>",
    { noremap = true, silent = true, desc = ":Neotree toggle<CR> - Toggles visibility of neo-tree." }
)
vim.keymap.set(
    "n",
    "<leader>e",
    ":Neotree focus<CR>",
    { noremap = true, silent = true, desc = ":Neotree focus<CR> - Jump cursor to neo-tree." }
)

-- neogit & git tree
vim.keymap.set("n", "<leader>gs",
    ":Neogit<CR>",
    { noremap = true, silent = true, desc = "Opens Neogit, for managing git changes and commits." })

--git (diffview)
vim.keymap.set(
    "n",
    "<leader>fh",
    ":DiffviewFileHistory<CR>",
    { noremap = true, silent = true, desc = ":DiffviewFileHistory<CR> - Opens file history in diffview." }
)
vim.keymap.set(
    "n",
    "<leader>df",
    ":DiffviewFileHistory %<CR>",
    {
        noremap = true,
        silent = true,
        desc = ":DiffviewFileHistory %<CR> - Opens file history in diffview for current file.",
    }
)

--launch lazy/mason
vim.keymap.set("n", "<leader>lz", ":Lazy<CR>", { noremap = true, silent = true, desc = ":Lazy<CR> - Launches lazy." })
vim.keymap.set(
    "n",
    "<leader>mn",
    ":Mason<CR>",
    { noremap = true, silent = true, desc = ":Mason<CR> - Launches mason." }
)

vim.keymap.set(
    "n",
    "<leader>bt",
    ":Barbecue toggle<CR>",
    { noremap = true, silent = true, desc = ":Barbecue toggle<CR> - Toggles barbecue." }
)

-- =================================== Diagnostics ===================================

vim.diagnostic.config({
    signs = {
        --support diagnostic severity / diagnostic type name
        text = {
            [1] = "",
            ["WARN"] = "",
            ["HINT"] = "",
        },
    },
})

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
