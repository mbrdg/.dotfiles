-- plugins/autocomplete.lua
-- autocompletion configuration

return {
	'saghen/blink.cmp',
	dependencies = 'rafamadriz/friendly-snippets',
	version = '*',
	opts = {
		keymap = { preset = 'super-tab' },
		signature = { enabled = true }, -- experimental
	},
}
