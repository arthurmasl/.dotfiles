require("telescope").setup({
	defaults = {
		-- ...
	},
	pickers = {
		-- theme = 'dropdown',
	},
	extensions = {
		require("telescope").load_extension("neoclip"),
	},
})
