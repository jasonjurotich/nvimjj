require("gitsigns").setup()

require("Comment").setup({
	toggler = {
		line = "gcc",
		block = "x,c",
	},
	opleader = {
		line = "gc",
		block = "x,",
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

-- require("auto-save").setup({
-- 	enabled = true,
-- 	trigger_events = { "InsertLeave" },
-- 	write_all_buffers = false,
-- })
