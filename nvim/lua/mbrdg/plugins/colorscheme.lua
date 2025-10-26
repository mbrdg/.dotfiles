-- plugins/colorscheme.lua
-- theme configuration (kanagawa)

return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('kanagawa').load('dragon')
  end
}
