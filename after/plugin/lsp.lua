local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
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
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gD", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.declaration()
	end, opts)
	vim.keymap.set("n", "gi", function()
		vim.lsp.buf.implementation()
	end, opts)
	vim.keymap.set("n", "gl", function()
		vim.lsp.buf.diagnostic_open_float()
	end, opts)
	vim.keymap.set("n", "<leader>D", function()
		vim.lsp.buf.show_line_diagnostics()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>ga", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.setup()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
require("luasnip.loaders.from_vscode").lazy_load()

vim.api.nvim_set_hl(0, "MyNormal", { bg = "None", fg = "White" })
vim.api.nvim_set_hl(0, "MyFloatBorder", { bg = "None", fg = "#464140" })
vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#837674", fg = "White" })

cmp.setup({

	-- snippet = {
	-- 	expand = function(args)
	-- 		luasnip.lsp_expand(args.body)
	-- 	end,
	-- },

	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.abort(), -- close completion window
		["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
	}),

	window = {
		completion = cmp.config.window.bordered({
			scrollbar = false,
			border = "rounded",
			winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder,CursorLine:MyCursorLine,Search:None",
		}),
		documentation = cmp.config.window.bordered({
			scrollbar = false,
			border = "rounded",
			winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder,CursorLine:MyCursorLine,Search:None",
		}),
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
		{ name = "cmp_tabnine" },
		{ name = "lua-latex-symbols", option = { cache = true } },
		{
			name = "spell",
			option = {
				keep_all_entries = true,
				enable_in_context = function()
					return true
				end,
			},
		},
	}),

	-- formatting = {
	-- 	format = function(entry, vim_item)
	-- 		vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
	-- 		vim_item.menu = source_mapping[entry.source.name]
	-- 		if entry.source.name == "cmp_tabnine" then
	-- 			local detail = (entry.completion_item.data or {}).detail
	-- 			vim_item.kind = ""
	-- 			if detail and detail:find(".*%%.*") then
	-- 				vim_item.kind = vim_item.kind .. " " .. detail
	-- 			end
	--
	-- 			if (entry.completion_item.data or {}).multiline then
	-- 				vim_item.kind = vim_item.kind .. " " .. "[ML]"
	-- 			end
	-- 		end
	-- 		local maxwidth = 80
	-- 		vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
	-- 		return vim_item
	-- 	end,
	-- },
})
