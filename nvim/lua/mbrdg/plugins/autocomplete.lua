-- plugins/autocomplete.lua
-- autocompletion configuration

return {
	'saghen/blink.cmp',
	dependencies = 'rafamadriz/friendly-snippets',
	version = '*',
	opts = {
		keymap = { preset = 'enter' },
		signature = { enabled = true }, -- experimental
	},
}
