local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"%.git",
			"node_modules",
			".nuxt",
			"build/",
			".DS_Store",
			".cache/",
			"vendor/",
			"examples/",
		},
		mappings = {
			i = {
				["<C-f>"] = actions.send_to_qflist,
				["<C-a>"] = actions.add_selected_to_qflist,
				["<C-s>"] = actions.send_selected_to_qflist,
			},
		},
	},
	pickers = {
		live_grep = {
			additional_args = function()
				return { "--hidden" }
			end,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("neoclip")
