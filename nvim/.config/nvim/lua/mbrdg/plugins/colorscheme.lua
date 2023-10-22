-- plugins/colorscheme.lua

return {
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'onedark'
  end,
  opts = {
    style = 'deeper',
  },
}

