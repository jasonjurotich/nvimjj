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

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

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

	-- TOOLS
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("wakatime/vim-wakatime")
	use("simrat39/rust-tools.nvim")
	use("szw/vim-maximizer")
	-- use("Pocco81/auto-save.nvim")

	-- FORMATTING
	use("windwp/nvim-autopairs")
	use("tpope/vim-surround")
	use("numToStr/Comment.nvim")

	use("lukas-reineke/indent-blankline.nvim")
	use("preservim/vim-pencil")
	use("p00f/nvim-ts-rainbow")
	use("lewis6991/gitsigns.nvim")

	-- STATUS, BUFFER, TERMINAL
	use("nvim-lualine/lualine.nvim")
	use("moll/vim-bbye")
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons",
	})
	use("akinsho/toggleterm.nvim")

	-- MARKDOWN
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- LSP
	use("kaputi/e-kaput.nvim") -- offers errors when you hover over the err, might not be needed.

	use("glepnir/lspsaga.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jayp0521/mason-null-ls.nvim",
			"j-hui/fidget.nvim",
			"onsails/lspkind.nvim",
		},
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"amarakon/nvim-cmp-lua-latex-symbols",
			"f3fora/cmp-spell",
		},
	})

	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
