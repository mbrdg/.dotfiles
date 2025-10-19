-- core/keymaps.lua
-- nvim keymaps

-- leader key
vim.g.mapleader = ' '

-- better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- remap to deal with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights from a search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- window management
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Temporary: disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move.<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move."<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move."<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move."<CR>')
