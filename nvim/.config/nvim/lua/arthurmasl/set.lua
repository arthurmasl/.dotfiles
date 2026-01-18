vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.hidden = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = ""
vim.opt.pumheight = 15

vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.cursorline = false
vim.opt.cursorlineopt = "both"
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.showtabline = 0
vim.opt.guicursor = {
  "n-v-c:block",        -- Normal/Visual/Command: block cursor
  "i-ci-ve:ver25",      -- Insert/Insert Cmdline/Visual Ex: vertical bar
  "r-cr:hor20",         -- Replace: horizontal bar
  "o:hor50",            -- Operator-pending
  "sm:block-blinkwait175-blinkoff150-blinkon175",  -- Showmatch
  "t:block"             -- Terminal mode: block (can remove blinking)
}

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

vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }

vim.opt.fillchars = {
	eob = " ",
}

vim.opt.lazyredraw = true
vim.opt.shell = "/bin/zsh"

vim.deprecate = function() end
vim.g.godot_executable = "/Applications/Godot.app/Contents/MacOS/Godot"
