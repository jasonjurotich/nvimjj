require('hardline').setup {
  theme = 'default',   -- change theme
  sections = {         -- define sections
    {class = 'mode', item = require('hardline.parts.mode').get_item},
    {class = 'error', item = require('hardline.parts.lsp').get_error},
    {class = 'warning', item = require('hardline.parts.lsp').get_warning},
    {class = 'low', item = require('hardline.parts.wordcount').get_item, hide = 100},
    {class = 'warning', item = require('hardline.parts.whitespace').get_item},
    -- {class = 'med', item = require('hardline.parts.filename').get_item},
  }, 
}

