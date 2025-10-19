-- plugins/treesitter.lua
-- treesitter configuration for syntax highlighting

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    local languages = { 'markdown', 'vimdoc', 'lua', 'python', 'rust' }

    local ts = require('nvim-treesitter')

    local installed = ts.get_installed()
    local toinstall = vim.iter(languages)
        :filter(function(parser) return not vim.tbl_contains(installed, parser) end)
        :totable()

    if #toinstall > 0 then
      ts.install(toinstall)
    end

    -- collect filetypes
    local filetypes = {}
    for _, language in ipairs(languages) do
      for _, filetype in ipairs(vim.treesitter.language.get_filetypes(language)) do
        table.insert(filetypes, filetype)
      end
    end

    -- start treesitter
    local ts_start = function(event)
      vim.treesitter.start(event.buf)
    end
    autocmd('FileType', filetypes, ts_start, 'Start Treesitter')
  end,
}
