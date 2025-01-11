-- plugins/mini.lua
-- collection of several small independent plugins

return {
	'echasnovski/mini.nvim',
	version = '*',
	config = function()
		require('mini.ai').setup { n_lines = 500 }

		local statusline = require 'mini.statusline'
		statusline.setup { use_icons = false }

		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return '%2l:%-2v'
		end

		require('mini.surround').setup()
		require('mini.pairs').setup()
		require('mini.trailspace').setup()
	end,
}
