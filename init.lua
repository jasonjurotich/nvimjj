require("jjnvim")

vim.cmd([[highlight NvimTreeCursorLine cterm=NONE ctermbg=NONE guibg=NONE gui=NONE]])
vim.cmd([[hi NormalFloat guibg=NONE ctermbg=NONE]])
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]])
vim.cmd([[hi CursorLine guibg=NONE ctermbg=NONE]])
vim.cmd([[hi StatusLine ctermbg=NONE cterm=NONE]])

vim.keymap.set("n", "gb", "<C-o>")
vim.keymap.set("n", "gf", "<C-i>")
vim.keymap.set("x", "gb", "<C-o>")

-- https://github.com/nvim-telescope/telescope.nvim/issues/605
--  in order to see git diff with delta in telescope.
