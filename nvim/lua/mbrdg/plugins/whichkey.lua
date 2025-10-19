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
      { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  },
}
