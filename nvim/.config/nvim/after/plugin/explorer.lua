-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 20
-- vim.g.netrw_keepdir = 0

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  renderer = { 
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = true,
      },
    }
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        -- { key = "<C-s>", action = "split" },
        { key = "<Up>", action = "toggle_file_info" },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = "H",
      info = "I",
      warning = "W",
      error = "E",
    },
  },
  filters = {
    dotfiles = false,
    custom = { "^\\.git", "^\\.DS_Store" }
  },
})

