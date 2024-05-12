local dap, dapui = require("dap"), require("dapui")

require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb" },
})

require("nvim-dap-virtual-text").setup({
	only_first_definition = false,
	all_references = true,
})

vim.keymap.set("n", "<Leader>bs", dap.continue)
vim.keymap.set("n", "<Leader>bc", dap.terminate)

vim.keymap.set("n", "<Leader>bn", dap.step_over)
vim.keymap.set("n", "<Leader>bp", dap.step_back)
vim.keymap.set("n", "<Leader>bi", dap.step_into)
vim.keymap.set("n", "<Leader>bo", dap.step_out)

vim.keymap.set("n", "<Leader>br", dap.restart)

vim.keymap.set("n", "<Leader>bb", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>bu", dap.clear_breakpoints)

vim.keymap.set("n", "<Leader>bB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)

dap.adapters.codelldb = {
	type = "server",
	host = "127.0.0.1",
	port = "${port}",
	executable = {
		command = "/Users/arthurmasl/.local/share/nvim/mason/bin/codelldb",
		args = { "--port", "${port}" },
	},
}

dap.configurations.c = {
	{
		name = "LLDB: Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/main", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		console = "integratedTerminal",
	},
}

dap.configurations.odin = {
	{
		name = "LLDB: Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/main", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		console = "integratedTerminal",
	},
}

-- require("dap-vscode-js").setup({
-- 	adapters = { "pwa-node", "pwa-chrome", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
-- })

for _, language in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }) do
	dap.configurations[language] = {
		{
			type = "pwa-chrome",
			request = "launch",
			name = "Start Chrome",
			url = "http://localhost:5173",
			webRoot = "${workspaceFolder}",
			userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach to bun",
			url = "ws://localhost:6499/",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch bun",
			cwd = "${workspaceFolder}",
			runtimeArgs = { "--inspect-brk" },
			program = "${file}",
			runtimeExecutable = "bun",
			attachSimplePort = 6499,
			-- url = "ws://localhost:6499/",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch deno",
			cwd = "${workspaceFolder}",
			runtimeArgs = { "run", "--inspect-brk" },
			program = "${file}",
			runtimeExecutable = "deno",
			attachSimplePort = 9229,
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch node",
			runtimeExecutable = "node",
			runtimeArgs = { "--inspect" },
			program = "${file}",
			cwd = "${workspaceFolder}",
			url = "ws://localhost:6499/",
		},
	}
end

dapui.setup({
	controls = {
		element = "repl",
		enabled = false,
		icons = {
			disconnect = "D",
			pause = "S",
			play = "P",
			run_last = "L",
			step_back = "<",
			step_into = "v",
			step_out = "<",
			step_over = ">>",
			terminate = "X",
		},
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end

vim.keymap.set("n", "<leader>bt", dapui.toggle)
