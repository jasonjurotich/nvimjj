local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	-- ICONS FOR MULTIPLE PLUGINS
	use("nvim-tree/nvim-web-devicons")

	-- TELESCOPE
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- used to add elements to telescope, not configured yet
	use("stevearc/dressing.nvim")
	-- use("nvim-telescope/telescope-ui-select.nvim")
	-- use("Slotos/telescope-lsp-handlers.nvim")

	-- put lsp actions in telescope
	-- use({
	-- 	"aznhe21/actions-preview.nvim",
	-- 	config = function()
	-- 		vim.keymap.set({ "v", "n" }, "ga", require("actions-preview").code_actions)
	-- 	end,
	-- })

	-- COLORSCHEME
	use({
		"Mofiqul/vscode.nvim",
		as = "vscode",
		config = function()
			vim.cmd("colorscheme vscode")
		end,
	})

	-- TREE SITTER
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
	})

	-- GIT
	-- https://alpha2phi.medium.com/neovim-for-beginners-source-code-control-71139e4513a1
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	-- TOOLS
	use("mbbill/undotree")
	use("wakatime/vim-wakatime")
	use("simrat39/rust-tools.nvim")
	use("szw/vim-maximizer")
	use("christoomey/vim-tmux-navigator")
	use("vim-scripts/ReplaceWithRegister")
	use("Pocco81/auto-save.nvim")

	-- FORMATTING
	use("windwp/nvim-autopairs")
	use("tpope/vim-surround")
	use("numToStr/Comment.nvim")

	use("lukas-reineke/indent-blankline.nvim")
	use("preservim/vim-pencil")
	use("p00f/nvim-ts-rainbow")
	use({
		"folke/todo-comments.nvim",
		opts = {},
	})

	-- STATUS, BUFFER, TERMINAL, EXPLORER
	use({
		"nvim-lualine/lualine.nvim",
	})

	-- puts vim statusline into tmux statusline
	use("vimpostor/vim-tpipeline")

	-- allows you to delete buffers with space df
	use("moll/vim-bbye")

	use("nvim-tree/nvim-tree.lua")
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
	})
	use("akinsho/toggleterm.nvim")

	-- MARKDOWN
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- LSP
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")

	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	use("amarakon/nvim-cmp-lua-latex-symbols")
	use("f3fora/cmp-spell")

	-- tabnine for lsp
	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	})

	-- show rust compiling in corner
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				window = {
					blend = 0,
					relative = "editor",
				},
			})
		end,
		tag = "legacy",
	})

	-- DEBUGGING
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("jayp0521/mason-nvim-dap.nvim")

	-- DATABASES
	use("tpope/vim-dadbod")
	use("kristijanhusak/vim-dadbod-ui")
	use("kristijanhusak/vim-dadbod-completion")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
