-- core/keymaps.lua
-- nvim keymaps

-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local km = vim.keymap

-- better default experience
km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- remap to deal with word wrap
km.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights from a search
km.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- window management
km.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
km.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
km.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
km.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Temporary: disable arrow keys in normal mode
km.set('n', '<left>', '<cmd>echo "Use h to move.<CR>')
km.set('n', '<right>', '<cmd>echo "Use l to move."<CR>')
km.set('n', '<up>', '<cmd>echo "Use k to move."<CR>')
km.set('n', '<down>', '<cmd>echo "Use j to move."<CR>')
