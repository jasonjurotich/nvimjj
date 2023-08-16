
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.rust_recommended_style = 0
vim.opt.ls = 0
vim.opt.ch = 0

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.list = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.undofile = true
vim.opt.wrap = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"

vim.opt.incsearch = true
vim.opt.scrolloff = 8

vim.opt.cursorline = false
vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true
vim.opt.backspace = "indent,eol,start"

vim.opt.clipboard:append("unnamedplus")
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.fillchars = "eob: "

vim.opt.iskeyword:append("-")
vim.opt.shortmess:append("c")
vim.opt.completeopt = "menu,menuone,noselect,noinsert"
vim.opt.spelllang = { "en_us", "es_mx" }

vim.cmd([[inoremap ww println!("{:#?}",);<left><left>]])
vim.cmd([[inoremap wu println!("DEBUG this is {:#?}",);<left><left>]])

vim.cmd([[hi NormalFloat guibg=NONE ctermbg=NONE]])
vim.cmd([[hi CursorLine guibg=NONE ctermbg=NONE]])
-- vim.api.nvim_set_keymap('n', '<Leader>x', '<Cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
vim.diagnostic.config({ virtual_text = false })
-- vim.g.nvim_tree_width = 25
vim.opt.termguicolors = true
vim.cmd[[highlight NvimTreeCursorLine cterm=NONE ctermbg=NONE guibg=NONE gui=NONE]]

