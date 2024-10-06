require("nightfox").setup({
	options = {
		transparent = true,
		dim_inactive = false,
	},
})

-- require("colorizer").setup({
-- 	lua = {
-- 		mode = "background",
-- 	},
-- 	odin = {
-- 		RGB = false, -- #RGB hex codes
-- 		RRGGBB = true, -- #RRGGBB hex codes
-- 		names = true, -- "Name" codes like Blue or blue
-- 		RRGGBBAA = true, -- #RRGGBBAA hex codes
-- 		rgb_fn = false, -- CSS rgb() and rgba() functions
-- 		hsl_fn = false, -- CSS hsl() and hsla() functions
-- 		css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
-- 		css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
-- 		mode = "background",
-- 	},
-- })

vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
-- vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'None', fg = '#495162' })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "None" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "None" })

-- vim.cmd("hi Normal ctermbg=none")
vim.cmd("colorscheme nordfox")

vim.api.nvim_set_hl(0, "LineNr", { bg = "None", fg = "#6b717d" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "None", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#32394a" })

vim.api.nvim_set_hl(0, "Pmenu", { bg = "#222831" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3e4d5c" })

-- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3f495a" })
-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3f495a" })
-- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3f495a" })

-- db ui
vim.api.nvim_set_hl(0, "NotificationInfo", { bg = "None" })
