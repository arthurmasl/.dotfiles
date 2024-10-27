local terminal = require("toggleterm")
local nvimtree_view = require("nvim-tree.view")

terminal.setup({
	open_mapping = [[<c-_>]],
	autochdir = false,
	start_in_insert = false,
	auto_scroll = true,
	-- size = 15,
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return 60
		end
	end,
	persist_mode = false,
	persist_size = false,
	direction = "vertical",
	on_open = function()
		local w = vim.api.nvim_win_get_width(vim.api.nvim_get_current_win())
		local h = vim.api.nvim_win_get_height(vim.api.nvim_get_current_win())
		local dir = w < h and "vertical" or "horizontal"

		if dir == "vertical" then
			if nvimtree_view.is_visible() then
				vim.cmd("NvimTreeClose")
			end

			vim.cmd("wincmd H")
			vim.cmd("vertical resize 60")
			return
		end
	end,
	-- on_close = function(term)
	-- 	term.direction = "vertical"
	-- end,
	-- direction = "vertical" | "horizontal" | "tab" | "float",
})

vim.cmd([[nnoremap <silent><c-_> <Cmd>exe v:count1 . "ToggleTerm"<CR>]])
vim.cmd([[inoremap <silent><c-_> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]])

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<C-o>", [[<Cmd>wincmd p<CR>]], opts)
vim.keymap.set("n", "<Leader>/", ":ToggleTerm<CR><Cmd>wincmd p<CR>", opts)

-- vim.keymap.set("n", "<Leader>tt", ":ToggleTerm direction=horizontal<CR>", opts)
vim.keymap.set("n", "<Leader>tt", function()
	local w = vim.api.nvim_win_get_width(vim.api.nvim_get_current_win())
	local h = vim.api.nvim_win_get_height(vim.api.nvim_get_current_win())
	local dir = w < h and "vertical" or "horizontal"

	if dir == "vertical" then
		vim.cmd("ToggleTerm")
		vim.cmd("ToggleTerm direction=horizontal")
	else
		vim.cmd("ToggleTerm")
		vim.cmd("ToggleTerm direction=vertical")
	end
end, opts)
-- vim.keymap.set("n", "<Leader>tt", ":ToggleTerm<CR><cmd>wincmd H<CR> <cmd>vertical-resize -60<CR>", opts)
