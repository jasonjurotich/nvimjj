-- require('hardline').setup {
--   theme = 'default',   -- change theme
--   sections = {         -- define sections
--     {class = 'mode', item = require('hardline.parts.mode').get_item},
--     {class = 'high', item = require('hardline.parts.git').get_item, hide = 100},
--     {class = 'error', item = require('hardline.parts.lsp').get_error},
--     {class = 'warning', item = require('hardline.parts.lsp').get_warning},
--     {class = 'low', item = require('hardline.parts.wordcount').get_item, hide = 100},
--     {class = 'warning', item = require('hardline.parts.whitespace').get_item},
--   },
-- }
--
-- https://vi.stackexchange.com/questions/19736/custom-string-colors-in-statusline

function GetMode()
	local mode = vim.fn.mode()
	if mode == "n" then
		return "N"
	elseif mode == "i" then
		return "I"
	elseif mode == "v" or mode == "V" then
		return "V"
	elseif mode == "s" or mode == "S" then
		return "S"
	elseif mode == "R" or mode == "Rv" then
		return "R"
	elseif mode == "!" then
		return "S"
	elseif mode == "c" then
		return "C"
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = " | ", right = " | " },
		section_separators = { left = " | ", right = " | " },
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
		},
	},
	sections = {
		lualine_a = {
			GetMode,
		},
		lualine_b = { "diff", "diagnostics" },
		lualine_c = { "searchcount" },
		lualine_x = { "require('lsp-progress').progress({max_size = 100})" },
		lualine_y = {},
		lualine_z = {},
	},

	inactive_sections = {
		lualine_a = { GetMode },
		lualine_b = { "diff", "diagnostics" },
		lualine_c = { "searchcount" },
		lualine_x = { "require('lsp-progress').progress({max_size = 100})" },
		lualine_y = {},
		lualine_z = {},
	},
})

vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User LspProgressStatusUpdated", {
	group = "lualine_augroup",
	callback = require("lualine").refresh,
})

-- "searchcount",
