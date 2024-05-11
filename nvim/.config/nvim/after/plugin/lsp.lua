require("mason").setup({
	ensure_installed = {},
})
require("mason-lspconfig").setup({})
require("lsp-format").setup({})

-- mason packages list:
-- "clang-format",
-- "clangd",
-- "codelldb",

-- "stylua",
-- "lua-language-server",

-- "tsserver",
-- "prettierd",
-- "eslint_d",
--
-- "volar"
-- "stylelint"

-- local rt = require("rust-tools")
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.offsetEncoding = "utf-8"

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		-- border = "rounded",
		-- source = "always",
		header = "",
		prefix = "",
	},
})

-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

lspconfig.tsserver.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig.volar.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.ols.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.glsl_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- rt.setup({
-- 	tools = {
-- 		runnables = {
-- 			use_telescope = true,
-- 		},
-- 		-- inlay_hints = {
-- 		-- 	auto = true,
-- 		-- 	show_parameter_hints = false,
-- 		-- 	parameter_hints_prefix = "",
-- 		-- 	other_hints_prefix = "",
-- 		-- },
-- 	},
--
-- 	server = {
-- 		settings = {
-- 			on_attach = on_attach,
-- 			["rust-analyzer"] = {
-- 				checkOnSave = {
-- 					command = "clippy",
-- 				},
-- 			},
-- 		},
-- 	},
-- })

-- vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
