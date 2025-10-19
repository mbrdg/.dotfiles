-- autocmds.lua
local gr = vim.api.nvim_create_augroup('mbdrg-config', {})
autocmd = function(event, pattern, callback, desc)
  local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end

-- highlight text on yank
local highlight_on_yank = function() vim.highlight.on_yank() end
autocmd('TextYankPost', {}, highlight_on_yank, 'Text Yank Highlighting')

-- start treesitter
local treesitter_start = function(event) vim.treesitter.start(event.buf) end
autocmd('FileType', { '<filetype>' }, treesitter_start, 'Start Treesitter')
