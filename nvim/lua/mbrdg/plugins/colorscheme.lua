-- plugins/colorscheme.lua
-- theme configuration (tokyonight)

return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'kanagawa-dragon'
    vim.cmd.hi 'Comment gui=none'
  end,
}
