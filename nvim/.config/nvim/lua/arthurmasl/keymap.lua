local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

map("n", "<Leader><CR>", ":source %<CR>", { silent = false })
map("n", "<Leader>w", ":w<CR>")
map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>Q", ":q!<CR>")
map("n", "<Leader>h", ":noh<CR>")
map("n", "<Leader>c", ":tabclose<CR>")

-- split
map("n", "s", "0i<CR><ESC>k")

-- explorer
map("n", "<Leader>e", ":NvimTreeFindFileToggle<CR>")

-- jump up/down
vim.keymap.set({ "n", "v", "o" }, "<Down>", "}", opts)
vim.keymap.set({ "n", "v", "o" }, "<Up>", "{", opts)

vim.keymap.set({ "n", "v", "o" }, "<Left>", "^", opts)
vim.keymap.set({ "n", "v", "o" }, "<Right>", "$", opts)

vim.cmd([[nnoremap <expr> & ':%s/'.expand('<cword>').'//gn<CR>``']])

-- rename
vim.cmd([[:nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>]])

-- spectre
vim.cmd([[nnoremap <leader>F <cmd>lua require('spectre').open()<CR>]])

-- diagnostic
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- LSP
vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<Leader>lc", vim.lsp.buf.code_action, opts)

vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<Leader>fr", require("telescope.builtin").lsp_references, opts)

vim.keymap.set("n", "<Leader>lds", require("telescope.builtin").lsp_document_symbols, opts)
vim.keymap.set("n", "<Leader>lws", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)

vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<Leader>lh", vim.lsp.buf.signature_help, opts)

-- telescope
map("n", "<Leader>ff", ":Telescope find_files hidden=false<CR>")
map("n", "<Leader>fg", ":Telescope live_grep hidden=false<CR>")
map("n", "<Leader>fp", ":Telescope buffers ignore_current_buffer=true sort_lastused=true sort_mru=true<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Leader>fd", ":Telescope diagnostics<CR>")
map("n", "<Leader>fu", ":Telescope git_status<CR>")
map("n", "<Leader>fb", ":Telescope git_branches<CR>")
map("n", "<Leader>fv", ":Telescope neoclip<CR>")
vim.keymap.set("n", "<Leader>fc", require("telescope.builtin").commands, opts)
vim.keymap.set("n", "<Leader>fk", require("telescope.builtin").keymaps, opts)

-- git
map("n", "<Leader>g", ":Neogit kind=split<CR>")
vim.keymap.set({ "n" }, "<Leader>hb", function()
	require("gitsigns").blame_line({ full = true })
end, { silent = true })
vim.keymap.set({ "n" }, "<Leader>tb", require("gitsigns").toggle_current_line_blame, { silent = true })
vim.keymap.set({ "n" }, "<Leader>td", require("gitsigns").toggle_deleted, { silent = true })
vim.keymap.set({ "n" }, "<Leader>dd", require("gitsigns").diffthis, { silent = true })

map("n", "]h", ":Gitsigns next_hunk<CR>")
map("n", "[h", ":Gitsigns previous_hunk<CR>")

map("n", "<Leader>dd", ":DiffviewOpen<CR>")
map("n", "<Leader>dh", ":DiffviewFileHistory<CR>")
map("n", "<Leader>dH", ":DiffviewFileHistory %<CR>")
