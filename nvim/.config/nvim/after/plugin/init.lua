vim.cmd(":TSInstall all")

require("nvim-surround").setup()
require("Comment").setup()
require("bufjump").setup()
require("nvim-autopairs").setup({
	check_ts = true,
})
