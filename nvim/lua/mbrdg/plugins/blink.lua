-- plugins/autocomplete.lua
-- autocompletion configuration

return {
  'saghen/blink.cmp',
  version = '1.*',
  opts = {
    keymap = { preset = 'enter' },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
  },
}
