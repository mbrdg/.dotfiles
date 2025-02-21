-- plugins/colorscheme.lua
-- theme configuration (one dark)

return {
	'olimorris/onedarkpro.nvim',
	priority = 1000,
	config = function()
		vim.cmd.colorscheme 'onedark_dark'
	end,
}
