require("mason").setup()
require("mason-lspconfig").setup()
require("lsp-format").setup({})

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
})

lspconfig.tsserver.setup({
	flags = lsp_flags,
	capabilities = capabilities,
})

lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	filetypes = {
		"css",
		"html",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		-- "typescriptreact",
	},
})

lspconfig.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
