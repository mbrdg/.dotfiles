-- core/keymaps.lua


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
km.set('n', '<leader>nh', ':nohl<CR>', { desc = '[N]o [H]ighlights' })

-- window management
km.set('n', '<leader>swv', '<C-w>v', { desc = '[S]plit [W]indow [V]ertically' })
km.set('n', '<leader>swh', '<C-w>h', { desc = '[S]plit [W]indow [H]orizontally' })

