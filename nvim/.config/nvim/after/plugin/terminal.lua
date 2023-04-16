require("toggleterm").setup({
	open_mapping = [[<c-_>]],
	autochdir = false,
	start_in_insert = true,
	auto_scroll = true,
	size = 15,
	-- persist_mode = true,
	-- persist_size = true,
	-- direction = "horizontal",
	-- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
})

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<C-o>", [[<Cmd>wincmd p<CR>]], opts)

vim.cmd([[nnoremap <silent><c-_> <Cmd>exe v:count1 . "ToggleTerm"<CR>]])
vim.cmd([[inoremap <silent><c-_> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]])
