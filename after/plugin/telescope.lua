local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- find files within current working directory, respects .gitignore
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope find_files cwd=~/<cr>") -- find files within root directory
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {}) -- find string in current working directory as you type
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) -- list open buffers in current neovim instance
vim.keymap.set('n', '<leader>fc', builtin.grep_string, {}) -- find string under cursor in current working directory
vim.keymap.set('n', '<leader>fh', builtin.diagnostics, {})

vim.keymap.set('n', '<leader>fg', builtin.git_files, {}) -- find files within github folder
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {}) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
vim.keymap.set('n', '<leader>gfc', builtin.git_bcommits, {}) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
vim.keymap.set('n', '<leader>go', builtin.git_branches, {})-- list git branches (use <cr> to checkout) ["gb" for git branch]
vim.keymap.set('n', '<leader>gs', builtin.git_status, {}) -- list current changes per file with diff preview ["gs" for git status]

vim.keymap.set("n", "<leader>s", function()
	require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({}))
end, { desc = "Spelling Suggestions" })

local tel = require("telescope")
local actions = require("telescope.actions")
tel.setup({
	defaults = {
		mappings = {
			i = {
				["<leader>q"] = actions.close, -- move to prev result
				["<leader>v"] = actions.select_vertical, -- open vertically
				["<leader>e"] = actions.preview_scrolling_up, -- move to prev result
				["<leader>d"] = actions.preview_scrolling_down, -- move to prev result
				["<S-Tab>"] = actions.move_selection_previous, -- move to prev result
				["<Tab>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
})

