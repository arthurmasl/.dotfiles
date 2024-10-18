require("toggleterm").setup({
	open_mapping = [[<c-_>]],
	autochdir = false,
	start_in_insert = false,
	auto_scroll = true,
	size = 15,
	persist_mode = false,
	persist_size = false,
	-- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
})

vim.cmd([[nnoremap <silent><c-_> <Cmd>exe v:count1 . "ToggleTerm"<CR>]])
vim.cmd([[inoremap <silent><c-_> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]])
