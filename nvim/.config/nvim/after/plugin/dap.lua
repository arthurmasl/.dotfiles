local dap, dapui, dapGo = require("dap"), require("dapui"), require("dap-go")

require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb" },
})

require("nvim-dap-virtual-text").setup({
	only_first_definition = false,
	all_references = true,
})

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

dap.configurations.zig = {
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

dapGo.setup({
	dap_configurations = {
		{
			type = "go",
			name = "Attach remote",
			mode = "remote",
			request = "attach",
		},
	},
	delve = {
		path = "dlv",
		initialize_timeout_sec = 20,
		port = "${port}",
		args = {},
		build_flags = {},
		detached = vim.fn.has("win32") == 0,
		cwd = nil,
	},
	tests = {
		verbose = false,
	},
})

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

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
end
