require("jjnvim.keymaps")
require("jjnvim.opts")
require("jjnvim.packer")

vim.cmd([[hi FloatBorder guifg=#515151 guibg=NONE]])
vim.api.nvim_set_hl(0, "FidgetTitle", { link = "NormalFloat" })
vim.api.nvim_set_hl(0, "FidgetTask", { link = "NormalFloat" })
