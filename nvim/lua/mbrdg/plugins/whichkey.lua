-- plugins/whichkey.lua
-- helper with keymaps

return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  spec = {
    { '<leader>c', group = '[C]ode' },
    { '<leader>d', group = '[D]ocument' },
    { '<leader>r', group = '[R]ename' },
    { '<leader>s', group = '[S]earch' },
    { '<leader>w', group = '[W]orkspace' },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
  },
  opts = {
    icons = {
      mappings = vim.g.have_nerd_font,
    },
  },
}
