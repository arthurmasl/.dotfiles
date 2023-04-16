vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.hidden = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.cursorline = false
vim.opt.cursorlineopt = "both"
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.showtabline = 0

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 20

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 50
vim.opt.autoread = true

-- vim.opt.foldlevel = 20
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }

vim.opt.fillchars = {
	eob = " ",
}
