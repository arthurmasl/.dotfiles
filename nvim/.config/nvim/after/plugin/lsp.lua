require("mason").setup({
	ensure_installed = {},
})
require("mason-lspconfig").setup({})
require("lsp-format").setup({})

local gopher = require("gopher")

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
		header = "",
		prefix = "",
	},
})

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

lspconfig.ts_ls.setup({
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

lspconfig.bashls.setup({
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

gopher.setup({
	commands = {
		go = "go",
		gomodifytags = "gomodifytags",
		gotests = "gotests",
		impl = "impl",
		iferr = "iferr",
		dlv = "dlv",
	},
	gotests = {
		template = "default",
		template_dir = nil,
		named = false,
	},
	gotag = {
		transform = "snakecase",
	},
})

lspconfig.dockerls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
