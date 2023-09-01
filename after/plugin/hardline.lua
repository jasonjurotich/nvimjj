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
--

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = " | ", right = " | " },
		section_separators = { left = " | ", right = " | " },
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
		},
	},
	sections = {
		lualine_a = {
			"mode",
		},

		lualine_b = { "diff", "diagnostics" },
		lualine_c = { "searchcount" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},

	inactive_sections = {
		lualine_a = { "mode" },
		lualine_b = { "diff", "diagnostics" },
		lualine_c = { "searchcount" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
})
