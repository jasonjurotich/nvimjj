-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------
local opts = { noremap = true, silent = true }

-- g_ is for going to end of line with last character non whitespace
-- only _ to go to the beginning of the line that is not whitespace

-- window management
keymap.set("n", "vs", ":vs<CR>") -- split window vertically, can also be <C-w>v
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("t", "J", "<C-\\><C-N><C-W><C-W>")
keymap.set("n", "L", "<C-W><C-W>")
keymap.set("n", "H", "<C-W><C-H>")

keymap.set("n", "tw", ":%s/\\s\\+$//e<CR>", { noremap = true, silent = true })
keymap.set("n", "Q", ":x<CR>")
keymap.set("n", "W", ":x<CR>:x<CR>")
keymap.set("n", "gn", "<C-t>")
keymap.set("n", "ss", "ZZ")
keymap.set("n", "te", ":ToggleTerm size=80 dir direction=vertical hidden=true <CR>")
keymap.set("n", "<Tab>", ":bnext<CR>", opts)
keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap.set("n", "<leader>df", ":w<CR>:bdelete!<CR>") -- this writes and then empties the buffer
-- keymap.set("n", "gv", ":RustFmt<CR>")
keymap.set("n", "z", "<C-d>zz")
keymap.set("n", "x", "<C-u>zz")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>h", ":nohlsearch<CR>") -- this hides the search reults from being highlighted
keymap.set("n", "-", "g_")
keymap.set("n", "0", "^")
keymap.set("n", "<leader>r", ":res +20<CR>")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "/", ":silent /") -- this removes the error that kept on coming out

keymap.set("n", "<S-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<S-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts)

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tu", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
keymap.set("n", "<leader>dt", ":tab DBUI<cr>", {})
keymap.set("n", "<leader>du", ":tabclose<CR>:bnext<CR>:Bdelete!<CR><C-W><C-W>ZZ", {})

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- goyo
keymap.set("n", "<leader>gy", ":Goyo 80<CR>")
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "gb", "<C-o>")
