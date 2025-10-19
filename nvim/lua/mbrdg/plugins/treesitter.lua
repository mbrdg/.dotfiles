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

    -- start treesitter
    local ts_start = function(event)
      vim.treesitter.start(event.buf)
      vim.wo.foldexpr = vim.treesitter.foldexpr()
      vim.bo.indentexpr = require('nvim-treesitter').indentexpr()
    end
    autocmd('FileType', { '<filetype>' }, ts_start, 'Start Treesitter')
  end,
}
