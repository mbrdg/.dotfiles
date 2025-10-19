-- plugins/treesitter.lua
-- treesitter configuration for syntax highlighting

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    local languages = { 'markdown', 'vimdoc', 'lua', 'rust' }
    require('nvim-treesitter').install(languages)
  end,
}
