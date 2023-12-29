local gitsigns = require("gitsigns")
local telescope = require("telescope.builtin")

local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", opts)

vim.keymap.set("n", "<Leader><CR>", ":source %<CR>", { silent = false }, opts)
vim.keymap.set("n", "<Leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<Leader>W", ":bufdo w<CR>", opts)
vim.keymap.set("n", "<Leader>q", ":q<CR>", opts)
vim.keymap.set("n", "<Leader>Q", ":qa<CR>", opts)
vim.keymap.set("n", "<Leader>C", ":tabclose<CR>", opts)
vim.keymap.set("n", "<Leader>h", ":noh<CR>", opts)

-- split
vim.keymap.set("n", "s", "o<ESC>", opts)
vim.keymap.set("n", "<C-s>", "O<ESC>", opts)
-- vim.keymap.set("n", "<C-a>", "a<CR><ESC>", opts)
-- vim.keymap.set("n", "<C-S>", "a<CR><ESC>k$", opts)

vim.keymap.set("n", "S", "s", opts)

-- explorer
vim.keymap.set("n", "<Leader>e", ":NvimTreeFindFileToggle<CR>", opts)
vim.keymap.set("n", "<Leader>E", ":NvimTreeFocus<CR>", opts)

-- alternative file
vim.keymap.set("n", "<C-y>", ":e #<CR>", opts)
-- vim.keymap.set("n", "<C-b>", ":bprevious<CR>", opts)
-- vim.keymap.set("n", "<C-n>", ":bnext<CR>", opts)
vim.keymap.set("n", "<C-b>", ":lua require('bufjump').backward()<cr>", opts)
vim.keymap.set("n", "<C-n>", ":lua require('bufjump').forward()<cr>", opts)

-- toggles
vim.keymap.set("n", "<Leader>ts", ":set spell!<CR>", opts)
vim.keymap.set("n", "<Leader>tf", ":FormatToggle<CR>", { silent = false })
vim.keymap.set("n", "<Leader>tb", gitsigns.toggle_current_line_blame, opts)
vim.keymap.set("n", "<Leader>td", gitsigns.toggle_deleted, opts)
vim.keymap.set("n", "<Leader>tg", function()
	gitsigns.blame_line({ full = true })
end, opts)

-- jump up/down
vim.keymap.set({ "n", "v", "o" }, "<Down>", "}", opts)
vim.keymap.set({ "n", "v", "o" }, "<Up>", "{", opts)

-- jump left/right
vim.keymap.set({ "n", "v", "o" }, "<Left>", "^", opts)
vim.keymap.set({ "n", "v", "o" }, "<Right>", "$", opts)

-- select word under cursor
vim.cmd([[nnoremap <expr> & ':%s/'.expand('<cword>').'//gn<CR>``']])
vim.keymap.set({ "v" }, "&", [[y/\V<C-r>=escape(@",'/\')<CR><CR>N]], opts)

-- rename
vim.cmd([[nnoremap <Leader>rw :%s/\<<C-r><C-w>\>//g<Left><Left>]])
vim.cmd([[nnoremap <Leader>rr :%s///g<Left><Left><Left>]])
vim.cmd([[nnoremap <Leader>rg :cdo %s///g<Left><Left><Left>]])
vim.keymap.set({ "v" }, "<Leader>rw", [[y:%s/<C-r>"//g<Left><Left>]])

-- resize alt + hjkl
vim.cmd([[nnoremap <C-w>6 :vertical-resize -20<CR>]])
vim.cmd([[nnoremap <C-w>) :vertical-resize +20<CR>]])
vim.cmd([[nnoremap <C-w>5 :res +10<CR>]])
vim.cmd([[nnoremap <C-w>4 :res -10<CR>]])

-- paste from
vim.keymap.set({ "n", "v", "o" }, "<leader>p", '"0p', opts)

-- movement with zz
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "gg", "ggzz", opts)
vim.keymap.set("n", "G", "Gzz", opts)

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- diagnostic
vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- LSP
vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<Leader>lc", vim.lsp.buf.code_action, opts)

vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
vim.keymap.set("n", "gD", telescope.lsp_implementations, opts)
vim.keymap.set("n", "gV", function()
	telescope.lsp_definitions({ jump_type = "vsplit" })
end, opts)
vim.keymap.set("n", "gX", function()
	telescope.lsp_definitions({ jump_type = "split" })
end, opts)
-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<Leader>lh", vim.lsp.buf.signature_help, opts)

-- telescope
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files hidden=true no_ignore=false<CR>", opts)
vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep no_ignore=false disable_coordinates=true<CR>", opts)
vim.keymap.set(
	"n",
	"<Leader>fp",
	":Telescope buffers ignore_current_buffer=true sort_lastused=true sort_mru=true<CR>",
	opts
)
vim.keymap.set("n", "<Leader>f'", telescope.registers, opts)

vim.keymap.set("n", "<Leader>fh", ":Telescope help_tags<CR>", opts)
vim.keymap.set("n", "<Leader>fd", ":Telescope diagnostics<CR>", opts)
vim.keymap.set("n", "<Leader>fu", ":Telescope git_status<CR>", opts)
vim.keymap.set("n", "<Leader>fb", ":Telescope git_branches<CR>", opts)
vim.keymap.set("n", "<Leader>fv", ":Telescope neoclip<CR>", opts)

vim.keymap.set("n", "<Leader>fr", telescope.lsp_references, opts)
vim.keymap.set("n", "<Leader>fr", function()
	telescope.lsp_references({ show_line = false })
end, opts)
vim.keymap.set("n", "<Leader>fs", telescope.lsp_document_symbols, opts)
vim.keymap.set("n", "<Leader>fS", telescope.lsp_dynamic_workspace_symbols, opts)

vim.keymap.set("n", "<Leader>f/", telescope.current_buffer_fuzzy_find, opts)
vim.keymap.set("n", "<Leader>fc", telescope.commands, opts)
vim.keymap.set("n", "<Leader>fk", telescope.keymaps, opts)
vim.keymap.set("n", "<Leader>fF", telescope.resume, opts)

vim.keymap.set("n", "<Leader>fq", function()
	telescope.quickfix({ show_line = false })
end, opts)
vim.keymap.set("n", "<Leader>fQ", telescope.quickfixhistory, opts)

vim.keymap.set("n", "]q", ":cnext<CR>", opts)
vim.keymap.set("n", "[q", ":cprev<CR>", opts)
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", opts)
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", opts)

-- git
vim.keymap.set("n", "<Leader>g", ":Neogit<CR>", opts)
vim.keymap.set("n", "<Leader>dd", ":DiffviewOpen<CR>", opts)
vim.keymap.set("n", "<Leader>db", ":DiffviewOpen develop<CR>", opts) -- origin-develop
vim.keymap.set("n", "<Leader>dH", ":DiffviewFileHistory<CR>", opts)
vim.keymap.set("n", "<Leader>dh", ":DiffviewFileHistory %<CR>", opts)

-- spectre
-- vim.cmd([[nnoremap <leader>F :lua require('spectre').open()<CR>]])
