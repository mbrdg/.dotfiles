-- plusing/lspconfig.lua
-- lsp configuration file

return {
	-- lsp configuration and plugins
	'neovim/nvim-lspconfig',
	dependencies = {
		'saghen/blink.cmp',
		{
			'folke/lazydev.nvim',
			ft = 'lua',
			opts = {
				library = {
					{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
				},
			},
		},
		-- automatically install lsps to stdpath for neovim
		-- mason must be loaded earlier, i.e., before mason-lspconfig
		-- this is achieved with `opts = {}`
		{ 'williamboman/mason.nvim', opts = {} },
		'williamboman/mason-lspconfig.nvim',
		-- status updates
		{ 'j-hui/fidget.nvim',       opts = {} },
	},
	config = function()
		local km = vim.keymap

		-- diagnostics
		km.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
		km.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or 'n'
					km.set(mode, keys, func, { buffer = event.buf, desc = 'LSP' .. desc })
				end

				local builtin = require 'telescope.builtin'
				map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
				map('gr', builtin.lsp_references, '[G]oto [R]eferences')
				map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
				map('<leader>D', builtin.lsp_type_definitions, '[T]ype [D]efinition')
				map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
				map('<leader>ws', builtin.lsp_workspace_symbols, '[W]orkspace [S]ymbols')

				map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
				map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
				map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if not client then
					return
				end

				if client.supports_method 'textDocument/documentHighlight' then
					local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
					vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd('LspDetach', {
						group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
						end,
					})
				end

				if client.supports_method 'textDocument/formatting' then
					vim.api.nvim_create_autocmd('BufWritePre', {
						buffer = event.buf,
						callback = function()
							vim.lsp.buf.format { bufnr = event.buf, id = client.id }
						end,
					})
				end

				if client.supports_method 'textDocument/inlayHint' then
					map('<leader>th', function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
					end, '[T]oogle Inlay [H]ints')
				end
			end,
		})

		-- enables language servers
		local servers = {
			clangd = {},
			pylsp = {},
			rust_analyzer = {},
			zls = {},
			gopls = {
				settings = {
					gopls = {
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = { callSnippet = 'Replace' },
						hint = { enable = true },
					},
				},
			},
		}

		local ensure_installed = vim.tbl_keys(servers)
		vim.list_extend(ensure_installed, {
			'stylua',       -- formats lua code
			'clang-format', -- formats c/c++ code
			'ruff',         -- formats python code
		})

		local capabilities = require('blink.cmp').get_lsp_capabilities()
		local lspconfig = require 'lspconfig'

		require('mason-lspconfig').setup {
			ensure_installed = vim.tbl_keys(servers),
			automatic_installation = false,
			handlers = {
				function(server_name)
					local config = servers[server_name] or {}
					config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})

					lspconfig[server_name].setup(config)
				end,
			},
		}
	end,
}
