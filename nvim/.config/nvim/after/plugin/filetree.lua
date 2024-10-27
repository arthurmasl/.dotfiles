vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function tree_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "<Up>", api.node.show_info_popup, opts("Info"))
	vim.keymap.set("n", "<C-g>", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open: Horizontal Split"))
end

require("nvim-tree").setup({
	on_attach = tree_attach,
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	renderer = {
		icons = {
			webdev_colors = false,
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = true,
			},
			glyphs = {
				git = {
					unstaged = "US",
					staged = "S",
					unmerged = "UM",
					renamed = "R",
					untracked = "UT",
					deleted = "D",
					ignored = "I",
				},
			},
		},
	},
	view = {
		adaptive_size = true,
		-- side = "right",
		preserve_window_proportions = false,
		-- width = 60,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = "H",
			info = "I",
			warning = "W",
			error = "E",
		},
	},
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = false,
	},
	filters = {
		dotfiles = false,
		git_ignored = true,
		custom = { "^\\.DS_Store" },
		-- custom = { "^\\.git", "^\\.DS_Store" },
	},
})
