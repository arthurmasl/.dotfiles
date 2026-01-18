local null_ls = require("null-ls")
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local lsp_formatting = function(bufnr)
-- 	vim.lsp.buf.format({
-- 		filter = function(client)
-- 			return client.name == "null-ls"
-- 		end,
-- 		bufnr = bufnr,
-- 	})
-- end

null_ls.setup({
	sources = {
		-- null_ls.builtins.formatting.stylua,

		-- null_ls.builtins.formatting.eslint_d,
		-- null_ls.builtins.formatting.prettierd,
		-- null_ls.builtins.formatting.stylelint,

		-- null_ls.builtins.formatting.rustfmt,

		-- null_ls.builtins.formatting.clang_format,
		-- null_ls.builtins.formatting.zigfmt,

		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports_reviser.with({
			extra_args = { "-rm-unused" },
		}),
		null_ls.builtins.formatting.golines,

		null_ls.builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}),
		null_ls.builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}),
	},
	on_attach = require("lsp-format").on_attach,
})

vim.cmd([[autocmd BufWritePre *.odin lua vim.lsp.buf.format()]])
vim.cmd([[autocmd BufWritePre *.glsl lua vim.lsp.buf.format()]])

vim.cmd([[autocmd BufWritePre *.rest call VrcQuery()]])
vim.cmd([[autocmd BufWritePre *.templ lua vim.lsp.buf.format()]])

vim.cmd([[autocmd BufWritePre *.gd lua vim.lsp.buf.format()]])

vim.api.nvim_create_autocmd("FileType", {
	pattern = "glsl",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
	end,
})
