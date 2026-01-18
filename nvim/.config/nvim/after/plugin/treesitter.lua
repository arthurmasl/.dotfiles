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
    "gdscript",
    "godot_resource",
    "gdshader"
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
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			include_surrounding_whitespace = false,
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
				["]i"] = "@conditional.outer",
				["]l"] = "@loop.outer",
				["]a"] = "@parameter.inner",
				["]o"] = "@call.inner",
				["]e"] = "@assignment.outer",
				["]/"] = "@comment.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
				["[i"] = "@conditional.outer",
				["[l"] = "@loop.outer",
				["[a"] = "@parameter.inner",
				["[o"] = "@call.inner",
				["[e"] = "@assignment.outer",
				["[/"] = "@comment.outer",
			},
		},
	},
})

