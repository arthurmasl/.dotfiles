require("nightfox").setup({
	options = {
		transparent = true,
		dim_inactive = false,
	},
})

vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "None" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "None" })

vim.cmd("colorscheme nordfox")

vim.api.nvim_set_hl(0, "LineNr", { bg = "None", fg = "#6b717d" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "None", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#32394a" })

vim.api.nvim_set_hl(0, "Pmenu", { bg = "#222831" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3e4d5c" })

-- db ui
vim.api.nvim_set_hl(0, "NotificationInfo", { bg = "None" })
