vim.cmd([[hi FloatBorder guifg=DarkGrey guibg=NONE]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=#515151 guibg=NONE]])

local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
	opts.buffer = bufnr

	opts.desc = "Go to declaration"
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.declaration()
	end, opts)

	opts.desc = "Code actions"
	vim.keymap.set("n", "ga", function()
		vim.lsp.buf.code_action()
	end, opts)

	opts.desc = "Hover info"
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)

	opts.desc = "Go to next diagnostic"
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)

	opts.desc = "Go to previous diagnostic"
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)

	opts.desc = "Rename function everywhere"
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
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
-- you must install brew install ltex-ls first
-- then you must add export PATH="/opt/homebrew/opt/ltex-ls:$PATH" to zshrc!!
require("lspconfig")["ltex"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "ltex-ls" },
	filetypes = { "markdown", "md", "gitcommit" },
	flags = { debounce_text_changes = 300 },
	settings = {
		ltex = {
			language = "en",
			language = "es",
		},
	},
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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.diagnostic.config({
	float = { border = "rounded" },
})
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=#515151 guibg=NONE]])
