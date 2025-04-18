-- plugins/lazydev.lua
-- LuaLS and nvim api configuration

return {
	'folke/lazydev.nvim',
	ft = 'lua',
	opts = {
		library = {
			-- Load luvit types when the `vim.uv` word is found
			{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
		},
	},
}
