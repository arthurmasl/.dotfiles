return require("packer").startup(function()
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })

	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "EdenEast/nightfox.nvim" })

	use({ "neovim/nvim-lspconfig" })

	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })

	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })

	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "lukas-reineke/lsp-format.nvim" })

	use({ "windwp/nvim-autopairs" })

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })
	use({ "kylechui/nvim-surround", tag = "*" })

	use({ "kyazdani42/nvim-tree.lua" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim", tag = "*" })
	use({ "numToStr/Comment.nvim" })

	use({ "NeogitOrg/neogit" })
	use({ "sindrets/diffview.nvim" })
	use({ "lewis6991/gitsigns.nvim" })

	use({ "AckslD/nvim-neoclip.lua" })
	use({ "kkharji/sqlite.lua", module = "sqlite" })

	-- use({ "mattn/emmet-vim" })
	-- use({ "windwp/nvim-spectre" })
	-- use({ "RRethy/vim-illuminate" })

	use("lewis6991/impatient.nvim")
	use("simrat39/rust-tools.nvim")

	use({
		"kwkarlwang/bufjump.nvim",
		config = function()
			require("bufjump").setup()
		end,
	})

	use("ThePrimeagen/vim-be-good")
end)
