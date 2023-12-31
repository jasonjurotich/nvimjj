require("toggleterm").setup({
	size = 80,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = false,
	shading_factor = 1,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	persist_mode = false,
	close_on_exit = true,
	direction = "vertical",
	shell = vim.o.shell,
})

local Terminal = require("toggleterm.terminal").Terminal

-- SPOTIFY
local spotify = Terminal:new({ cmd = "spt", hidden = true, direction = "float" })
function _SPOTIFY()
	spotify:toggle()
end

vim.api.nvim_set_keymap("n", "sp", "<cmd>lua _SPOTIFY()<CR>", { noremap = true, silent = true })

-- BOTTOM
local bottom = Terminal:new({ cmd = "btm", hidden = true, direction = "float" })
function _BOTTOM()
	bottom:toggle()
end

vim.api.nvim_set_keymap("n", "mb", "<cmd>lua _BOTTOM()<CR>", { noremap = true, silent = true })


function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'kj', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
