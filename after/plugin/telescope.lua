-- https://www.reddit.com/r/neovim/comments/116ydjp/lazynvim_cmd_option_for_telescope/
-- Telescope uses ripgrep, need to have it installed from before installing Telescope

local builtin = require("telescope.builtin")

local tel = require("telescope")
local actions = require("telescope.actions")

tel.setup({
	-- extensions = {
	-- 	["ui-select"] = {
	-- 		require("telescope.themes").get_dropdown({}),
	-- 	},
	-- },
	defaults = {
		mappings = {
			i = {
				["<leader>q"] = actions.close, -- move to prev result
				["<leader>v"] = actions.select_vertical, -- open vertically
				["<leader>t"] = actions.select_tab, -- open vertically
				["<leader>e"] = actions.preview_scrolling_up, -- move to prev result
				["<leader>d"] = actions.preview_scrolling_down, -- move to prev result
				["<S-Tab>"] = actions.move_selection_previous, -- move to prev result
				["<Tab>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
})

tel.load_extension("fzf")
-- tel.load_extension("ui-select")

-- FILES
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files in cwd" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
vim.keymap.set(
	"n",
	"<leader>fp",
	"<cmd>Telescope find_files cwd=~/<cr>",
	{ desc = "Fuzzy gind files from root directory" }
) -- find files within root directory
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Live Grep in cwd" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List buffers in Neovim" })
vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Grep word under cursor in cwd" })

-- LSP
vim.keymap.set("n", "<leader>di", builtin.diagnostics, { desc = "List diagnostic errors and warnings" })
vim.keymap.set("n", "<leader>re", builtin.lsp_references, { desc = "List where function is used" })
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "List functions in current document" })
vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, { desc = "List functions in worksspace" })

vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
vim.keymap.set("n", "ge", builtin.lsp_definitions, {desc = "go to original variable"})
vim.keymap.set("n", "td", builtin.lsp_type_definitions, {})

-- GIT
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find files in github folder" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "List commits in github folder" })
vim.keymap.set("n", "<leader>gfc", builtin.git_bcommits, { desc = "List commits in present document or buffer" })
vim.keymap.set("n", "<leader>go", builtin.git_branches, { desc = "List git branches" })
vim.keymap.set(
	"n",
	"<leader>gs",
	builtin.git_status,
	{ desc = "List changes with diff preview for present document or buffer" }
)

-- OTHERS
vim.keymap.set("n", "<leader>km", builtin.keymaps, { desc = "List keymaps" })

vim.keymap.set("n", "<leader>s", function()
	require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({}))
end, { desc = "Spelling Suggestions" })
-- vim.keymap.set("n", "<leader>ss", builtin.spell_suggest, { desc = "Listo spelling suggestions" })
