-- core/options.lua
-- neovim options

-- nerd font
vim.g.have_nerd_font = false

-- do not set highlighting on search
vim.o.hlsearch = false

-- make line numbers (w/ relative numbers) the default
vim.wo.number = true
vim.wo.relativenumber = true

-- mouse support
vim.o.mouse = 'a'

-- do not show mode that is already in the status line
vim.o.showmode = false

-- sync clipboard between OS and nvim
vim.o.clipboard = 'unnamedplus'

-- enable break indent
vim.o.breakindent = true

-- case insensitive seach
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumn by default
vim.wo.signcolumn = 'yes'
-- add a colorcolumn
vim.o.colorcolumn = '80'

-- minimal visible lines
vim.o.scrolloff = 10

-- decrease the update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- better completion
vim.o.completeopt = 'menuone,noselect'

-- preview substitutions
vim.o.inccommand = 'split'

-- window splitting
vim.o.splitright = true
vim.o.splitbelow = true

-- true colors
vim.o.termguicolors = true
