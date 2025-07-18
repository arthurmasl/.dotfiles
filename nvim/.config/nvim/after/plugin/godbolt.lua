require("godbolt").setup({
	languages = {
		cpp = { compiler = "g122", options = {} },
		c = { compiler = "cg122", options = {} },

		-- go = { compiler = "gccgoarm641420", options = {} },
		go = { compiler = "arm64_gltip", options = {} },
		odin = { compiler = "odin-dev-2025-01", options = {} },
	},
	auto_cleanup = true,
	highlight = {
		cursor = "Visual",
		-- static = { "#222222", "#333333", "#444444", "#555555", "#444444", "#333333" },
		static = false,
	},
	quickfix = {
		enable = false,
		auto_open = false,
	},
	url = "https://godbolt.org",
})
