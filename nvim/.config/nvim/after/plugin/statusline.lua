local custom_theme = require("lualine.themes.auto")

custom_theme.normal.c.bg = "#222831"

require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = custom_theme,
		component_separators = "",
		section_separators = "",
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
		-- lualine_z = {'%l:%c / %L'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	-- tabline = {
	-- 	lualine_a = { "buffers" },
	-- },
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
