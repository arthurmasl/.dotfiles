require("mason").setup()
require("mason-lspconfig").setup()
require("lsp-format").setup({})

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	-- float = {
	-- 	border = "rounded",
	-- 	source = "always",
	-- 	header = "",
	-- 	prefix = "",
	-- },
})

-- vim.cmd([[
-- set signcolumn=yes
-- autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
-- ]])

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
	-- on_attach = on_attach,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.cmd("TermExec cmd='gcc ./app.c; ./a.out'")
				end,
			})
		end
	end,
})

-- vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
