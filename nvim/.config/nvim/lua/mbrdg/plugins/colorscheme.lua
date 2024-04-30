-- plugins/colorscheme.lua
-- theme configuration (onedark inspired by atom editor)

return {
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    require('tokyonight').setup {
      style = 'night',
      light_style = 'day',
      terminal_colors = false,
      styles = {
        comments = { italic = true },
        functions = { bold = true },
      },
    }

    vim.cmd.colorscheme 'tokyonight'
    vim.cmd.hi 'Comment gui=none'
  end,
}
