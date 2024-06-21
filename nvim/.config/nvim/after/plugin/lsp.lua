require("mason").setup({
	ensure_installed = {},
})
require("mason-lspconfig").setup({})
require("lsp-format").setup({})

-- mason packages list:
--
-- clangd
-- codelldb
-- eslint_d
-- glsl_analyzer
-- gofumpt
-- goimports-reviser
-- golines
-- gopls
-- lua-language-server lua_ls
-- ols
-- prettierd
-- stylelint
-- stylua
-- typescript-language-server tsserver
-- vue-language-server volar
-- zls

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

-- vim.cmd([[autolocal on_attach = function(client, bufnr)

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

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

lspconfig.zls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.glsl_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})

-- vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")

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
