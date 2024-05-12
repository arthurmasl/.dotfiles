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
	},
	on_attach = require("lsp-format").on_attach,
})

-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	pattern = "*.odin",
-- 	command = 'silent execute "!odinfmt -w" | e',
-- })

-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

vim.api.nvim_create_augroup("AutoFormatting", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.odin",
	group = "AutoFormatting",
	callback = function()
		vim.lsp.buf.format({ async = true })
	end,
})
