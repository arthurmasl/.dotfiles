local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.enable_tab_bar = false
-- config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.enable_scroll_bar = false

config.disable_default_key_bindings = false
config.disable_default_mouse_bindings = true
config.mouse_wheel_scrolls_tabs = false
config.alternate_buffer_wheel_scroll_speed = 0
config.audible_bell = "Disabled"

config.font = wezterm.font({
	family = "Menlo",
	weight = "Regular",
	-- stretch = "Expanded",
})

config.font_size = 14.5
config.cell_width = 0.90
config.line_height = 1.00
config.allow_square_glyphs_to_overflow_width = "Always"
config.custom_block_glyphs = false
config.freetype_load_target = "Light"
config.freetype_render_target = "Light"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.background = {
	{
		source = {
			Color = "#2e3440",
		},
		width = "100%",
		height = "100%",
		hsb = {
			brightness = 1.0,
		},
		-- opacity = 0.8,
	},
	{
		source = {
			File = "/Users/arthurmasl/.dotfiles/misc/haruhi-4k.jpg",
		},

		hsb = {
			brightness = 1.0,
		},

		width = "Cover",
		height = "Cover",

		vertical_align = "Middle",
		horizontal_align = "Center",
		-- opacity = 0.40,
		opacity = 0.005,
	},
}

config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[0]
config.max_fps = 120
config.animation_fps = 120

config.colors = {
	foreground = "#cdcdce",
	background = "#2f333e",

	cursor_bg = "#cdcdce",
	cursor_fg = "#404959",
	cursor_border = "#cdcdce",

	selection_fg = "#cdcdce",
	selection_bg = "#404959",

	split = "#cdcdce",

	ansi = {
		"#3c4150",
		"#b2666b",
		"#a8bd90",
		"#e5cc93",
		"#87a0be",
		"#ae8fab",
		"#93becd",
		"#e5e8ef",
	},
	brights = {
		"#49567c",
		"#c3737a",
		"#b7d09b",
		"#ebd4a0",
		"#93adce",
		"#c097bc",
		"#9fcad9",
		"#e7ebf3",
	},

	indexed = { [136] = "#af8700" },
	compose_cursor = "orange",
}

config.keys = {
	-- { key = '=', mods = 'CTRL', action = wezterm.action.IncreaseFontSize },
	-- { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },
	-- { key = '0', mods = 'CTRL', action = wezterm.action.ResetFontSize },
	{
		key = "z",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

return config
