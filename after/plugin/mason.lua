require("mason").setup({ PATH = "prepend" })
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
		"rust_analyzer",
		"texlab",
		"jsonls",
		"marksman",
		"taplo",
		"ltex",
    "codelldb"
	},
	automatic_installation = true,
})

-- require("mason-null-ls").setup({
-- 	ensure_installed = {
-- 		"prettier",
-- 		"stylua",
-- 		"eslint_d",
-- 		"markdownlint",
-- 		"cspell",
-- 	},
-- 	automatic_installation = true,
-- })
