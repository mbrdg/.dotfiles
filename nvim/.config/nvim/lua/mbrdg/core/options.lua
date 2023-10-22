-- core/options.lua


-- make line numbers the default
vim.wo.number = true

-- mouse support
vim.o.mouse = 'a'

-- sync clipboard between OS and nvim
vim.o.clipboard = 'unnamedplus'

-- enable break indent
vim.o.breakindent = true

-- case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumn by default
vim.wo.signcolumn = 'yes'

-- add a colorcolumn
vim.o.colorcolumn = 80

-- decrease the update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- better completion
vim.o.completeopt = 'menuone,noselect'

-- true colors
vim.o.termguicolors = true

