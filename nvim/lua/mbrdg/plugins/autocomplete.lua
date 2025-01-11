-- plugins/autocomplete.lua
-- autocompletion configuration

return {
	'saghen/blink.cmp',
	dependencies = 'rafamadriz/friendly-snippets',
	version = '*',
	opts = {
		keymap = { preset = 'default' },
		signature = { enabled = true }, -- experimental
	},
}
