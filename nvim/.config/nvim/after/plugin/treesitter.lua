require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"typescript",
		"tsx",
		"javascript",
		"lua",
		"json",
		"html",
		"css",
		"scss",
		"markdown",
		"regex",
		"java",
		"c",
		"rust",
		"toml",
		"bash",
		"gitignore",
		"odin",
		"zig",
		"sql",
		"go",
		"dockerfile",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,

			keymaps = {
				-- S scope
				["as"] = "@local.scope",

				-- F function
				["af"] = "@function.outer",
				["if"] = "@function.inner",

				-- C class/struct
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",

				-- I contitional(if)
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",

				-- L loop
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",

				-- A parameter/argument
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",

				-- O function call
				["ao"] = "@call.outer",
				["io"] = "@call.inner",

				-- E assignment (Equal sign =)
				["ae"] = "@assignment.outer",
				["ie"] = "@assignment.inner",

				-- / comment (text)
				["a/"] = "@comment.outer",
			},
			-- You can choose the select mode (default is charwise 'v')
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * method: eg 'v' or 'o'
			-- and should return the mode ('v', 'V', or '<c-v>') or a table
			-- mapping query_strings to modes.
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * selection_mode: eg 'v'
			-- and should return true or false
			include_surrounding_whitespace = true,
		},
	},
})
