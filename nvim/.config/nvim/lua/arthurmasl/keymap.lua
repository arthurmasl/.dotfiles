local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

map("n", "<Leader><CR>", ":source %<CR>", { silent = false })
map("n", "<Leader>w", ":w<CR>")
map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>Q", ":qa<CR>")
map("n", "<Leader>C", ":tabclose<CR>")
-- map("n", "<Leader>Q", ":q!<CR>")
map("n", "<Leader>h", ":noh<CR>")

-- split
map("n", "s", "o<ESC>")
map("n", "<C-s>", "O<ESC>")
-- map("n", "<C-a>", "a<CR><ESC>")
-- map("n", "<C-S>", "a<CR><ESC>k$")

-- explorer
map("n", "<Leader>e", ":NvimTreeFindFileToggle<CR>")
map("n", "<Leader>E", ":NvimTreeFocus<CR>")

-- alternative file
map("n", "<C-b>", ":e #<CR>")

-- toggles
map("n", "<Leader>ts", ":set spell!<CR>")
vim.keymap.set("n", "<Leader>tf", ":FormatToggle<CR>", { silent = false })
vim.keymap.set({ "n" }, "<Leader>tb", require("gitsigns").toggle_current_line_blame, { silent = true })
vim.keymap.set({ "n" }, "<Leader>td", require("gitsigns").toggle_deleted, { silent = true })

-- jump up/down
vim.keymap.set({ "n", "v", "o" }, "<Down>", "}", opts)
vim.keymap.set({ "n", "v", "o" }, "<Up>", "{", opts)

-- jump left/right
vim.keymap.set({ "n", "v", "o" }, "<Left>", "^", opts)
vim.keymap.set({ "n", "v", "o" }, "<Right>", "$", opts)

vim.cmd([[nnoremap <expr> & ':%s/'.expand('<cword>').'//gn<CR>``']])

-- rename
vim.cmd([[nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>]])

-- spectre
-- vim.cmd([[nnoremap <leader>F :lua require('spectre').open()<CR>]])

-- resize alt + hjkl
vim.cmd([[nnoremap <C-w>3 :vertical-resize -10<CR>]])
vim.cmd([[nnoremap <C-w>) :vertical-resize +10<CR>]])
vim.cmd([[nnoremap <C-w>2 :res +10<CR>]])
vim.cmd([[nnoremap <C-w>1 :res -10<CR>]])

-- copy path
-- vim.cmd([[nnoremap <leader>p :let @+ = expand("%")<CR>]])

-- paste from
vim.keymap.set({ "n", "v", "o" }, "<leader>p", '"0p', opts)

-- movement with zz
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "gg", "ggzz")
map("n", "gd", "gdzz")
map("n", "G", "Gzz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- diagnostic
vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- LSP
vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<Leader>lc", vim.lsp.buf.code_action, opts)

vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
vim.keymap.set("n", "gD", require("telescope.builtin").lsp_implementations, opts)
-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "<Leader>fr", require("telescope.builtin").lsp_references, opts)

vim.keymap.set("n", "<Leader>fs", require("telescope.builtin").lsp_document_symbols, opts)
vim.keymap.set("n", "<Leader>fS", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)

vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<Leader>lh", vim.lsp.buf.signature_help, opts)

-- telescope
map("n", "<Leader>ff", ":Telescope find_files hidden=true no_ignore=false<CR>")
map("n", "<Leader>fg", ":Telescope live_grep no_ignore=false disable_coordinates=true<CR>")
-- map("n", "<Leader>fs", ":Telescope grep_string<CR>")
map("n", "<Leader>fp", ":Telescope buffers ignore_current_buffer=true sort_lastused=true sort_mru=true<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Leader>fd", ":Telescope diagnostics<CR>")
map("n", "<Leader>fu", ":Telescope git_status<CR>")
map("n", "<Leader>fb", ":Telescope git_branches<CR>")
map("n", "<Leader>fv", ":Telescope neoclip<CR>")

vim.keymap.set("n", "<Leader>f/", require("telescope.builtin").current_buffer_fuzzy_find, opts)
vim.keymap.set("n", "<Leader>fc", require("telescope.builtin").commands, opts)
vim.keymap.set("n", "<Leader>fk", require("telescope.builtin").keymaps, opts)
vim.keymap.set("n", "<Leader>fF", require("telescope.builtin").resume, opts)

vim.keymap.set("n", "<Leader>fq", require("telescope.builtin").quickfix, opts)
vim.keymap.set("n", "<Leader>fQ", require("telescope.builtin").quickfixhistory, opts)

vim.keymap.set("n", "]q", ":cnext<CR>", opts)
vim.keymap.set("n", "[q", ":cprev<CR>", opts)

-- git
-- vim.keymap.set({ "n" }, "<Leader>g", require("neogit").open({ kind = "split" }), { silent = true })
-- map("n", "<Leader>g", ":Neogit kind=split<CR>")
map("n", "<Leader>g", ":Neogit<CR>")
vim.keymap.set({ "n" }, "<Leader>hb", function()
	require("gitsigns").blame_line({ full = true })
end, { silent = true })
vim.keymap.set({ "n" }, "<Leader>dd", require("gitsigns").diffthis, { silent = true })

map("n", "]h", ":Gitsigns next_hunk<CR>")
map("n", "[h", ":Gitsigns prev_hunk<CR>")

map("n", "<Leader>dd", ":DiffviewOpen<CR>")
map("n", "<Leader>db", ":DiffviewOpen origin/develop<CR>")
-- map("n", "<Leader>db", ":DiffviewOpen HEAD~2<CR>")
map("n", "<Leader>dH", ":DiffviewFileHistory<CR>")
map("n", "<Leader>dh", ":DiffviewFileHistory %<CR>")
