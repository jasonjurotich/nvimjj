require("vscode").setup({
	transparent = true,
	italic_comments = true,
	disable_nvimtree_bg = true,
	group_overrides = {
		BufferLineFill = { fg = "NONE" },
	},
})

function Colorpens(color) 
	color = color or "vscode"
	vim.cmd.colorscheme(color)
end

Colorpens()

vim.cmd([[hi NormalFloat guibg=NONE ctermbg=NONE]])

