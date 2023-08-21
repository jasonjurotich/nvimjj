local on_attach = function(client, bufnr)
	local opts1 = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts1) -- jump to previous diagnostic in buffer
	vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts1) -- jump to next diagnostic in buffer
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts1) -- show documentation for what is under cursor
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts1) -- got to declaration
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts1) -- smart rename
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lsp_flags = {
	debounce_text_changes = 150,
}

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure lua
require("lspconfig")["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- configure html server
require("lspconfig")["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

-- configure css server
require("lspconfig")["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure ltex server
require("lspconfig")["ltex"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "ltex-ls" }, -- FIX  needs to have full path to work!!
	filetypes = { "markdown", "text", "md", "bib", "plaintext", "tex", "gitcommit", "pandoc" },
	flags = { debounce_text_changes = 300 },
})

-- markdown
require("lspconfig")["marksman"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
--
-- configure tailwindcss server
require("lspconfig")["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure emmet language server
require("lspconfig")["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

require("rust-tools").setup({
	tools = {
		executor = require("rust-tools.executors").termopen,
		reload_workspace_from_cargo_toml = true,

		inlay_hints = {
			auto = true,
			only_current_line = true,
			show_parameter_hints = true,
			parameter_hints_prefix = "<- ",
			other_hints_prefix = "-> ",
		},
	},

	server = {
		capabilities = capabilities,
		on_attach = on_attach,
		standalone = true,

		settings = {
			["rust-analyzer"] = {
				assist = {
					importPrefix = "by_self",
				},
				cargo = {
					allFeatures = true,
				},
				checkOnSave = {
					command = "clippy",
				},
				lens = {
					references = true,
					methodReferences = true,
				},
			},
		},
	},

	dap = {
		adapter = {
			type = "executable",
			command = "lldb-vscode",
			name = "rt_lldb",
		},
	},
})
