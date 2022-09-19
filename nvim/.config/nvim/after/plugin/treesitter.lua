require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'typescript',
    'tsx',
    'javascript',
    'lua',
    'json',
    'html',
    'css',
    'scss',
    'markdown',
    'regex',
    'java',
    'bash',
    'gitignore',
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true
  },
  indent = {
    enable = true
  },
}

-- vim.opt.foldmethod='expr'
-- vim.opt.foldexpr='nvim_treesitter#foldexpr()'
