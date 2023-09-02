require("gitsigns").setup()

vim.api.nvim_set_hl(0, "MyNormal", { bg = "None", fg = "White" })
vim.api.nvim_set_hl(0, "MyNormalNC", { bg = "None", fg = "None" })
vim.api.nvim_set_hl(0, "MyNonText", { bg = "None", fg = "None" })
vim.api.nvim_set_hl(0, "MyNormalFloat", { bg = "None", fg = "None" })
vim.api.nvim_set_hl(0, "MyFloatBorder", { bg = "None", fg = "#464140" })
vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#837674", fg = "White" })

require("dressing").setup({
	input = {
		win_options = {
			winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder,CursorLine:MyCursorLine,NormalFloat:MyNormalFloat,NormalNC:MyNormalNC,NonText:MyNonText,Search:None",
		},
	},
})

require("Comment").setup({
	toggler = {
		line = "gcc",
	},
	opleader = {
		line = "gc",
	},
})
require("indent_blankline").setup({
	buftype_exclude = { "terminal" },
	filetype_exclude = { "dashboard", "packer" },
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = false,
})

require("nvim-autopairs").setup({
	check_ts = true, -- enable treesitter
	ts_config = {
		lua = { "string" },
		javascript = { "template_string" },
		java = false,
	},
	condition = function()
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
})

-- https://raw.githubusercontent.com/kyazdani42/nvim-tree.lua/master/doc/nvim-tree-lua.txt
-- commands for nvim-tree
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})

-- require("auto-save").setup({
-- 	enabled = true,
-- 	trigger_events = { "InsertLeave" },
-- 	write_all_buffers = false,
-- })
