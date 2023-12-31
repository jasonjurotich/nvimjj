-- https://github.com/TechnicalDC/NvConf/blob/main/lua/plugins/ui.lua
-- https://github.com/folke/noice.nvim#-noice-nice-noise-notice
-- https://youtu.be/nxzds7GN6oY?si=FYclJcrZpYo_JMOV
-- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes
-- https://github.com/folke/noice.nvim/blob/main/lua/noice/config/views.lua

-- vim.api.nvim_set_hl(0, "MyNormal", { bg = "None", fg = "None" })
-- vim.api.nvim_set_hl(0, "MyNormalNC", { bg = "None", fg = "None" })
-- vim.api.nvim_set_hl(0, "MyNonText", { bg = "None", fg = "None" })
-- vim.api.nvim_set_hl(0, "MyNormalFloat", { bg = "None", fg = "None" })
-- vim.api.nvim_set_hl(0, "MyFloatBorder", { bg = "None", fg = "#464140" })
-- vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#837674", fg = "White" })
--
-- -- vim.cmd([[hi FloatBorder guifg=#515151  guibg=NONE]])
-- --
-- local rounded_border_style = {
-- 	top_left = "╭",
-- 	top = "─",
-- 	top_right = "╮",
-- 	left = "│",
-- 	right = "│",
-- 	bottom_left = "╰",
-- 	bottom = "─",
-- 	bottom_right = "╯",
-- }
-- require("noice").setup({
-- 	background_colour = "#000000",
-- 	views = {
-- 		cmdline_popup = {
--       position = {
-- 						row = 15,
-- 						col = "50%",
-- 					},
-- 			filter_options = {},
-- 			border = {
-- 				style = rounded_border_style,
-- 			},
-- 			win_options = {
--         winblend = 0,
-- 				winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder",
-- 			}
-- 		},
--     popupmenu = {
-- 			win_options = {
--         winblend = 0,
-- 				winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder",
-- 			},
--
--     }
-- 	},
-- 	lsp = {
-- 		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
-- 		override = {
-- 			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
-- 			["vim.lsp.util.stylize_markdown"] = true,
-- 			["cmp.entry.get_documentation"] = true,
-- 		},
-- 	},
-- 	-- you can enable a preset for easier configuration
-- 	presets = {
-- 		bottom_search = true, -- use a classic bottom cmdline for search
-- 		command_palette = true, -- position the cmdline and popupmenu together
-- 		long_message_to_split = true, -- long messages will be sent to a split
-- 		inc_rename = false, -- enables an input dialog for inc-rename.nvim
-- 		lsp_doc_border = true, -- add a border to hover docs and signature help
-- 		scrollbar = false,
-- 	},
-- })
--
--
-- vim.cmd([[hi FloatBorder guifg=#515151  guibg=NONE]])
