require("diffview").setup({
	use_icons = false,
	signs = {
		fold_closed = "+",
		fold_open = "-",
		done = "✓",
	},
	-- enhanced_diff_hl = true,
	view = {
		-- Configure the layout and behavior of different types of views.
		-- Available layouts:
		--  'diff1_plain'
		--    |'diff2_horizontal'
		--    |'diff2_vertical'
		--    |'diff3_horizontal'
		--    |'diff3_vertical'
		--    |'diff3_mixed'
		--    |'diff4_mixed'
		-- For more info, see ':h diffview-config-view.x.layout'.
		default = {
			layout = "diff2_horizontal",
		},
		merge_tool = {
			layout = "diff3_horizontal",
			-- layout = "diff1_plain",
			disable_diagnostics = true,
		},
		file_history = {
			layout = "diff2_horizontal",
		},
	},
})
