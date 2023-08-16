require("jjnvim")

vim.cmd[[highlight NvimTreeCursorLine cterm=NONE ctermbg=NONE guibg=NONE gui=NONE]]
-- https://github.com/nvim-telescope/telescope.nvim/issues/605
--  in order to see git diff with delta in telescope.
