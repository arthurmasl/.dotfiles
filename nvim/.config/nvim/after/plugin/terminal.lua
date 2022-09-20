require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	autochdir = false,
	start_in_insert = true,
	auto_scroll = true,
	size = 15,
	-- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

vim.cmd([[nnoremap <silent><c-\> <Cmd>exe v:count1 . "ToggleTerm"<CR>]])
vim.cmd([[inoremap <silent><c-\> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]])
