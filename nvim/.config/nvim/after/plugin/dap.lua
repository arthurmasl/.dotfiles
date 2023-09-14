local dap, dapui = require("dap"), require("dapui")

vim.keymap.set("n", "bs", dap.continue)
vim.keymap.set("n", "bc", dap.terminate)

vim.keymap.set("n", "bn", dap.step_over)
vim.keymap.set("n", "bi", dap.step_into)
vim.keymap.set("n", "bp", dap.step_out)

vim.keymap.set("n", "bb", dap.toggle_breakpoint)
vim.keymap.set("n", "bB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)

require("dap-vscode-js").setup({
	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
	debugger_path = "/Users/arthurmasl/Work/vscode-js-debug", -- Path to vscode-js-debug installation.
	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = { "pwa-node", "pwa-chrome", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
	-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
	-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
	-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript", "typescriptreact" }) do
	dap.configurations[language] = {
		{
			type = "pwa-chrome",
			request = "launch",
			name = 'Start Chrome with "localhost"',
			url = "http://localhost:5173",
			webRoot = "${workspaceFolder}",
			userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
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
