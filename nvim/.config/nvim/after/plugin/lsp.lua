require("mason").setup()
require("mason-lspconfig").setup()
require("lsp-format").setup({})

local rt = require("rust-tools")
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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

-- lspconfig.emmet_ls.setup({
-- 	capabilities = capabilities,
-- 	filetypes = {
-- 		"css",
-- 		"html",
-- 		"javascriptreact",
-- 		"less",
-- 		"sass",
-- 		"scss",
-- 	},
-- })

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
					vim.cmd("TermExec cmd='clear; gcc ./main.c -lcs50; ./a.out'")
					-- vim.cmd("TermExec cmd='gcc ./main.c; ./a.out'")
				end,
			})
		end
	end,
})

rt.setup({
	tools = {
		runnables = {
			use_telescope = true,
		},
		-- inlay_hints = {
		-- 	auto = true,
		-- 	show_parameter_hints = false,
		-- 	parameter_hints_prefix = "",
		-- 	other_hints_prefix = "",
		-- },
	},

	server = {
		settings = {
			on_attach = on_attach,
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
})

-- vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
