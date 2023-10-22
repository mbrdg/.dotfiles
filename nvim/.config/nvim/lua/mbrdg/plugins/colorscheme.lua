-- plugins/colorscheme.lua

return {
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'onedark'
    require('onedark').setup {
      style = 'warmer',
      code_style = {
        functions = 'bold',
      },
    }
    require('onedark').load()
  end,
}

