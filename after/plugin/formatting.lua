require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		json = { "prettier" },
		ymal = { "prettier" },
		rust = { "rustfmt" },
		markdown = { "markdownlint" },
	},
})

local conform = require("conform")
vim.keymap.set({ "v", "n" }, "gv", function()
	conform.format({ lsp_format = true, async = false, timeout_ms = 500 })
end, { desc = "Format file" })
