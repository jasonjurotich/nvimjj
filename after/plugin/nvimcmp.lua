local luasnip = require("luasnip")
require("luasnip/loaders/from_vscode").lazy_load()

local cmp = require("cmp")

vim.api.nvim_set_hl(0, "MyNormal", { bg = "None", fg = "White" })
vim.api.nvim_set_hl(0, "MyFloatBorder", { bg = "None", fg = "#464140" })
vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#837674", fg = "White" })

cmp.setup({

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-y>"] = cmp.mapping.abort(), -- close completion window
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-i>"] = cmp.mapping.scroll_docs(4),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end),
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
		{ name = "ltex" },
    { name = "crates" },
		{ name = "lua-latex-symbols", option = { cache = true } },
		-- {name = 'copilot'},
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
})
