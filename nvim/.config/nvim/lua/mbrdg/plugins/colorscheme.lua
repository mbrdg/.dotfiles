-- plugins/colorscheme.lua
-- theme configuration (onedark inspired by atom editor)

return {
  'navarasu/onedark.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('onedark').setup {
      style = 'dark',
      code_style = {
	functions = 'bold',
      },
    }
    require('onedark').load()
  end,
}
