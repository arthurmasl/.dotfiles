vim.cmd(":TSInstall all")

require("nvim-surround").setup()
require("Comment").setup()
require("bufjump").setup({
	forward_key = "<C-n>",
	backward_key = "<C-b>",
})
require("nvim-autopairs").setup({
	check_ts = true,
})
