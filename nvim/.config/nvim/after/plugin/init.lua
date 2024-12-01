vim.cmd(":TSInstall all")

require("nvim-surround").setup()
require("Comment").setup()
require("bufjump").setup({
	forward_key = "C-b",
	backward_key = "C-n",
})
require("nvim-autopairs").setup({
	check_ts = true,
})
