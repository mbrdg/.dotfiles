-- plugins/treesitter.lua
-- treesitter configuration for syntax highlighting

return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	branch = 'main',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter').install({ 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'zig' })
	end,
}
