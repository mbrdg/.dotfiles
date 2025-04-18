-- plugins/whichkey.lua
-- helper with keymaps

return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	opts = {
		delay = 0,
		icons = {
			mappings = false,
		},
		spec = {
			{ '<leader>g', group = '[G]oto',     mode = { 'n', 'x' } },
			{ '<leader>s', group = '[S]earch' },
			{ '<leader>t', group = '[T]oggle' },
			{ '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
		},
	},
}
