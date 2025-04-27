-- core/options.lua
-- neovim options

-- make line numbers (w/ relative numbers) the default
vim.wo.number = true
vim.wo.relativenumber = true

-- mouse support
vim.o.mouse = 'a'

-- do not show mode that is already in the status line
vim.o.showmode = false

-- sync clipboard between OS and nvim
vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

-- enable break indent
vim.o.breakindent = true

-- case insensitive seach
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumn by default
vim.wo.signcolumn = 'yes'

-- minimal visible lines
vim.o.scrolloff = 10

-- decrease the update time
vim.o.updatetime = 250
vim.o.timeoutlen = 500

-- better completion
vim.o.completeopt = 'menuone,noselect'

-- preview substitutions
vim.o.inccommand = 'split'

-- window splitting
vim.o.splitright = true
vim.o.splitbelow = true

-- true colors
vim.o.termguicolors = true
