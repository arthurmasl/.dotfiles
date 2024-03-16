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
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "kylechui/nvim-surround" })

	use({ "kyazdani42/nvim-tree.lua" })
	-- use({ "stevearc/oil.nvim" })

	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "numToStr/Comment.nvim" })
	use({ "kwkarlwang/bufjump.nvim" })

	use({ "NeogitOrg/neogit" })
	use({ "sindrets/diffview.nvim" })
	use({ "lewis6991/gitsigns.nvim" })

	use({ "AckslD/nvim-neoclip.lua" })
	use({ "kkharji/sqlite.lua", module = "sqlite" })

	use({
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"mxsdev/nvim-dap-vscode-js",
		},
	})

	use({
		"microsoft/vscode-js-debug",
		opt = true,
		run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	})
	-- use({ "mattn/emmet-vim" })
	-- use({ "windwp/nvim-spectre" })
	-- use({ "RRethy/vim-illuminate" })
	-- use({ "simrat39/rust-tools.nvim" })
	-- use({ "ThePrimeagen/vim-be-good" })
end)
