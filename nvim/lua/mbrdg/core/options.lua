-- core/options.lua
-- neovim options

vim.o.mouse = 'a'          -- mouse support

vim.o.termguicolors = true -- nicer 24-bit colors
vim.o.winborder = 'none'

vim.o.number = true
vim.o.relativenumber = true

vim.o.showmode = false -- already shown by the status line
vim.o.ruler = false    -- already shown by the status line

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'                            -- add sign column

vim.o.complete = '.,w,b,kspell'                     -- fewer completion sources
vim.o.completeopt = 'menuone,noselect,fuzzy,nosort' -- better behavior

vim.o.splitkeep = 'screen'
vim.o.splitright = true
vim.o.splitbelow = true
