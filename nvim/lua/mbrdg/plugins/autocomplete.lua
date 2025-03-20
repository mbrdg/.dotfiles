-- plugins/autocomplete.lua
-- autocompletion configuration

return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    keymap = { preset = 'super-tab' },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true }, -- experimental
  },
}
