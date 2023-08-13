local custom_vscode = require("lualine.themes.vscode")

custom_vscode.normal.c.bg = "None"
custom_vscode.insert.c.bg = "None"
custom_vscode.command.c.bg = "None"

require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = custom_vscode,
		component_separators = "|",
		section_separators = "",
		path = 2,
	},
})
