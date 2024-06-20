local neogit = require("neogit")
local diffview = require("diffview")
local gitsigns = require("gitsigns")

neogit.setup({
	disable_insert_on_commit = false,
	disable_commit_confirmation = true,
	integrations = {
		diffview = true,
	},
	mappings = {
		status = {
			["o"] = "Toggle",
		},
	},
})

diffview.setup({
	use_icons = false,
	signs = {
		fold_closed = "+",
		fold_open = "-",
		done = "✓",
	},
	-- enhanced_diff_hl = true,
	view = {
		default = {
			layout = "diff2_horizontal",
		},
		merge_tool = {
			layout = "diff1_plain",
			disable_diagnostics = true,
		},
		file_history = {
			layout = "diff2_horizontal",
		},
	},

	keymaps = {
		file_panel = {
			["q"] = ":DiffviewClose<CR>",
		},
		file_history_panel = {
			["q"] = ":DiffviewClose<CR>",
		},
		view = {
			["q"] = ":DiffviewClose<CR>",
		},
	},
})

gitsigns.setup({
	signs = {
		add = { text = "│" },
		untracked = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
	signcolumn = true,
	numhl = false,
	linehl = false,
	word_diff = false,
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 100,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	-- yadm = {
	-- 	enable = false,
	-- },
})
