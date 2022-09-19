-- local function status_line()
--   local mode = '%-3{%v:lua.string.upper(v:lua.vim.fn.mode())%}'
--   local file_name = '%-.16t'
--   local modified = ' %-m'
--   local right_align = '%='
--   local line_no = '%10([%l/%L%)]'
--   local pct_thru_file = '%5p%%'
--
--   return string.format(
--     '%s%s%s%s%s%s',
--     mode,
--     file_name,
--     modified,
--     right_align,
--     line_no,
--     pct_thru_file
--   )
-- end
--
-- vim.opt.statusline = status_line()

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', path=1}},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
    -- lualine_z = {'%l:%c / %L'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
