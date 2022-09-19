require('toggleterm').setup{
  -- open_mapping = [[<leader>\]],
  open_mapping = [[<c-\>]],
  start_in_insert = false,
  size = 15,
  autochdir = false
  -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
}
 
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.cmd [[nnoremap <silent><c-\> <Cmd>exe v:count1 . "ToggleTerm"<CR>]]
vim.cmd [[inoremap <silent><c-\> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>]]
