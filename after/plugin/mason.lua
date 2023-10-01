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
	},
	automatic_installation = true,
})

-- require("mason-null-ls").setup({
-- 	ensure_installed = {
-- 		"cspell",
-- 	},
-- 	automatic_installation = true,
-- })
