require("toggleterm").setup({
	open_mapping = [[<c-\>]],
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
vim.keymap.set("t", "<c-b>", [[<Cmd>wincmd p<CR>]], opts)

vim.cmd([[nnoremap <silent><c-\> <Cmd>exe v:count1 . "ToggleTerm"<CR>]])
vim.cmd([[inoremap <silent><c-\> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]])
