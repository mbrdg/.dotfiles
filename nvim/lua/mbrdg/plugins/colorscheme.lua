-- plugins/colorscheme.lua
-- theme configuration (one dark)

return {
	'olimorris/onedarkpro.nvim',
	priority = 1000,
	init = function()
		vim.cmd.colorscheme 'onedark_dark'
		vim.cmd.hi 'Comment gui=none'
	end,
}
