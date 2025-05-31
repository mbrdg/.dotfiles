-- autocmds.lua

-- highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- start treesitter on filetype basis
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'zig', 'python' },
	callback = function()
		vim.treesitter.start()
		vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end
})
