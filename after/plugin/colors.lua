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
vim.cmd([[hi CursorLine guibg=NONE ctermbg=NONE]])
vim.cmd[[highlight NvimTreeCursorLine cterm=NONE ctermbg=NONE guibg=NONE gui=NONE]]
vim.cmd[[hi StatusLine ctermbg=NONE cterm=NONE]]
