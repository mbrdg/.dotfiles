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

		local hipatterns = require 'mini.hipatterns'
		hipatterns.setup {
			highlighters = {
				fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
				hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
				todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
				note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		}

		local indentscope = require 'mini.indentscope'
		indentscope.setup {
			draw = { animation = indentscope.gen_animation.none() },
		}

		require('mini.surround').setup()
		require('mini.pairs').setup()
		require('mini.trailspace').setup()
	end,
}
