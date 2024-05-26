-- plugins/mini.ai
-- collection of several small independent plugins

return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup()
    require('mini.surround').setup()
    require('mini.pairs').setup()
    require('mini.trailspace').setup()
  end,
}
