local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.color_scheme = "AdventureTime"
--
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.enable_scroll_bar = false
--
config.disable_default_key_bindings = false
config.disable_default_mouse_bindings = true

config.font = wezterm.font({ family = "Menlo", weight = "Regular" })
config.font_size = 14.5

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_background_image = "~/.dotfiles/misc/har-dark.jpg"
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

config.max_fps = 120
config.animation_fps = 120

config.colors = {
	foreground = "#cdcdce",
	background = "#2f333e",

	cursor_bg = "#cdcdce",
	cursor_fg = "#404959",

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

return config
