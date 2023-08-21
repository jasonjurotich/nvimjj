local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = {
		formatting.rustfmt,
		formatting.prettier,
		formatting.stylua,
		formatting.markdownlint,
		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js")
			end,
		}),
	},

  -- format on escape
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
