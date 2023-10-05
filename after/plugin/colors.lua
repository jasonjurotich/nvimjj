require("vscode").setup({
	transparent = true,
	italic_comments = false,
	disable_nvimtree_bg = true,
	group_overrides = {
		BufferLineFill = { fg = "Black" },
		BufferLineBufferSelected = { fg = "Yellow" },
	},
})

function Colorpens(color)
	color = color or "vscode"
	vim.cmd.colorscheme(color)
end

Colorpens()

vim.cmd([[hi NormalFloat cterm=NONE guibg=NONE ctermbg=NONE gui=NONE]])
vim.cmd([[hi Pmenu guibg=NONE ctermbg=NONE]])
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NonText guibg=NONE ctermbg=NONE]])
vim.cmd([[hi CursorLine guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NvimTreeCursorLine cterm=NONE ctermbg=NONE guibg=NONE gui=NONE]])
vim.cmd([[hi StatusLine ctermbg=NONE cterm=NONE]])
vim.cmd([[hi FloatBorder guifg=DarkGrey guibg=NONE]])

vim.cmd("highlight FidgetTitle ctermbg=NONE guibg=NONE")
vim.cmd("highlight FidgetTask ctermbg=NONE guibg=NONE")
vim.api.nvim_win_set_option(0, "winblend", 0)
vim.api.nvim_set_hl(0, "FidgetTitle", { link = "NormalFloat" })
vim.api.nvim_set_hl(0, "FidgetTask", { link = "NormalFloat" })
-- vim.cmd("autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE")
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=#515151 guibg=NONE]])
