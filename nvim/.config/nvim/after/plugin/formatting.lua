local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,

		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylelint,

		-- null_ls.builtins.formatting.rustfmt,

		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.zigfmt,

		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.formatting.golines,
	},
	on_attach = require("lsp-format").on_attach,
})

-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	pattern = "*.odin",
-- 	command = 'silent execute "!odinfmt -w" | e',
-- })

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
