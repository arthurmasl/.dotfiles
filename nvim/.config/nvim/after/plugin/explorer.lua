vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	renderer = {
		icons = {
			webdev_colors = false,
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = true,
			},
			glyphs = {
				git = {
					unstaged = "US",
					staged = "S",
					unmerged = "UM",
					renamed = "R",
					untracked = "UT",
					deleted = "D",
					ignored = "I",
				},
			},
		},
	},
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				-- { key = "<C-s>", action = "split" },
				{ key = "<Up>", action = "toggle_file_info" },
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = "H",
			info = "I",
			warning = "W",
			error = "E",
		},
	},
	git = {
		show_on_dirs = false,
	},
	filters = {
		dotfiles = false,
		custom = { "^\\.DS_Store" },
		-- custom = { "^\\.git", "^\\.DS_Store" },
	},
})
