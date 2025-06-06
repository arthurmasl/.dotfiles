vim.g.vrc_set_default_mapping = 0
vim.g.vrc_response_default_content_type = "application/json"
vim.g.vrc_output_buffer_name = "rest_output.json"
vim.g.vrc_auto_format_response_patterns = {
	json = "jq",
}
vim.g.vrc_horizontal_split = true

vim.keymap.set("n", "<Leader>xr", ":call VrcQuery()<CR>", opts)
