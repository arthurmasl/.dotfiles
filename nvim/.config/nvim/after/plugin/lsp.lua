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

local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

vim.filetype.add({ extension = { templ = "templ" } })

local servers = {
	"ts_ls",
	"volar",
	"templ",
	"clangd",
	"zls",
	"bashls",
	"glsl_analyzer",
	"dockerls",
	"sqlls",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.ols.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		enable_snippets = true,
		enable_inlay_hints = true,
		enable_references = true,
		enable_rename = true,
		enable_checker_only_saved = true,
		checker_args = "-vet -strict-style",
	},
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "opts", "use" },
			},
		},
	},
})

lspconfig.emmet_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "templ" },
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html" },
})

lspconfig.htmx.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "templ" },
})

lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				unusedvariable = true,
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
