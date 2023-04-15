require("telescope").setup({
	defaults = {
		file_ignore_patterns = { ".git", "node_modules" },
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-f>"] = require("telescope.actions").send_to_qflist,
				["<C-a>"] = require("telescope.actions").add_selected_to_qflist,
				["<C-s>"] = require("telescope.actions").send_selected_to_qflist,
			},
		},
	},
	pickers = {
		-- theme = 'dropdown',
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("neoclip")
