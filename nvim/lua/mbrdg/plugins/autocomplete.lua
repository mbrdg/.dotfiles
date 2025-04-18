-- plugins/autocomplete.lua
-- autocompletion configuration

return {
	'saghen/blink.cmp',
	event = 'VimEnter',
	version = '1.*',
	dependencies = {
		'folke/lazydev.nvim',
	},
	opts = {
		keymap = { preset = 'default' },
		completion = {
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
		},
		sources = {
			default = { 'lsp', 'path', 'buffer', 'lazydev' },
			providers = {
				lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
			},
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' },
		signature = { enabled = true },
	},
}
