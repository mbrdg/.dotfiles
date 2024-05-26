-- plugins/todo.lua
-- highlighter for special words

return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependecies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    signs = false,
  },
}
