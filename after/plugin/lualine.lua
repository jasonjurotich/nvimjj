require('hardline').setup {
  bufferline = false,  -- disable bufferline
  theme = 'catppuccin_minimal',   -- change theme
  sections = {         -- define sections
    {class = 'mode', item = require('hardline.parts.mode').get_item},
    {class = 'high', item = require('hardline.parts.git').get_item, hide = 100},
    {class = 'med', item = require('hardline.parts.filename').get_item},
    '%<',
    {class = 'med', item = '%='},
    {class = 'error', item = require('hardline.parts.lsp').get_error},
    {class = 'warning', item = require('hardline.parts.lsp').get_warning},
    {class = 'warning', item = require('hardline.parts.whitespace').get_item},
  },
}







-- local custom_vscode = require("lualine.themes.vscode")

-- custom_vscode.normal.c.bg = "None"
-- custom_vscode.insert.c.bg = "None"
-- custom_vscode.command.c.bg = "None"
--
-- require("lualine").setup({
-- 	options = {
-- 		icons_enabled = false,
-- 		theme = custom_vscode,
-- 		component_separators = "|",
-- 		section_separators = "",
--     sections = {
--       lualine_x = {},
--     },
-- 		path = 2,
-- 	}
-- })

