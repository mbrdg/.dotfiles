-- plugins/autocomplete.lua
-- autocompletion configuration

return {
	'saghen/blink.cmp',
	version = '1.*',
	dependencies = {
		'folke/lazydev.nvim',
	},
	opts = {
		keymap = { preset = 'enter' },
		sources = {
			default = { 'lsp', 'path', 'buffer' },
			per_filetype = {
				lua = { inherit_defaults = true, 'lazydev' }
			},
			providers = {
				lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
			},
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' },
		signature = { enabled = true },
	},
}
