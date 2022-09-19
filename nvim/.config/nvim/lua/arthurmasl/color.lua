require("nightfox").setup({
	options = {
		transparent = true,
		dim_inactive = false,
	},
})

vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
-- vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'None', fg = '#495162' })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "None" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "None" })

-- vim.cmd("hi Normal ctermbg=none")
vim.cmd("colorscheme nordfox")

vim.api.nvim_set_hl(0, "LineNr", { bg = "None", fg = "#6b717d" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "None", fg = "#ffffff" })
