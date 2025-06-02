-- plugins/snacks.lua
-- quality-of-life picker collection

return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	opts = {
		picker = {},
	},
	keys = {
		{ '<leader>sh', function() Snacks.picker.help() end, desc = '[S]earch [H]elp' },
		{ '<leader>sk', function() Snacks.picker.keymaps() end, desc = '[S]earch [K]eymaps' },
		{ '<leader>sf', function() Snacks.picker.files() end, desc = '[S]earch [F]iles' },
		{ '<leader>ss', function() Snacks.picker.pickers() end, desc = '[S]earch [S]nacks' },
		{ '<leader>sw', function() Snacks.picker.grep_word() end, desc = '[S]earch current [W]ord', mode = { 'n', 'x' } },
		{ '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch by [G]rep' },
		{ '<leader>sd', function() Snacks.picker.diagnostics() end, desc = '[S]earch [D]iagnostics' },
		{ '<leader>sr', function() Snacks.picker.resume() end, desc = '[S]earch [R]esume' },
		{ '<leader>s.', function() Snacks.picker.recent() end, desc = '[S]earch Recent Files ("." for repeat)' },
		{ '<leader><leader>', function() Snacks.picker.buffers() end, desc = '[ ] Find existing buffers' },
		{ '<leader>/', function() Snacks.picker.lines() end, desc = '[/] Fuzzily search in current buffers' },
		{ '<leader>s/', function() Snacks.picker.grep_buffers() end, desc = '[/] Fuzzily search in current buffers' },
	},
}
