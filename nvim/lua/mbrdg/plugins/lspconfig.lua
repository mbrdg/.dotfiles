-- plusing/lspconfig.lua
-- lsp configuration file

return {
	-- lsp configuration and plugins
	'neovim/nvim-lspconfig',
	dependencies = {
		-- automatically install lsps to stdpath for neovim
		{ 'mason-org/mason.nvim', opts = {} },
		'mason-org/mason-lspconfig.nvim',
		-- status updates
		{ 'j-hui/fidget.nvim',    opts = {} },
		'saghen/blink.cmp',
	},
	config = function()
		local km = vim.keymap

		-- diagnostics
		vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
		})

		km.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
		km.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

		-- lsp attachment
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or 'n'
					km.set(mode, keys, func, { buffer = event.buf, desc = 'LSP' .. desc })
				end

				map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
				map('gra', vim.lsp.buf.code_action, 'Code [A]ction', { 'n', 'x' })

				map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
				map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementations')
				map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinitions')

				-- declaration != definition, e.g., in C this would go to the header
				map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

				map('gO', require('telescope.builtin').lsp_document_symbols, '[O]pen Document Symbols')
				map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open [W]orkspace Symbols')
				map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if not client then
					return
				end

				if client:supports_method('textDocument/documentHighlight', event.buf) then
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

				if client:supports_method('textDocument/formatting', event.buf) then
					vim.api.nvim_create_autocmd('BufWritePre', {
						buffer = event.buf,
						callback = function()
							vim.lsp.buf.format { bufnr = event.buf, id = client.id }
						end,
					})
				end

				if client:supports_method('textDocument/inlayHint', event.buf) then
					map('<leader>th', function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
					end, '[T]oogle Inlay [H]ints')
				end
			end,
		})

		-- language server configurations
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						completion = { callSnippet = 'Replace' },
						hint = { enable = true },
					},
				},
			},
			gopls = {},
			pylsp = {},
			rust_analyzer = {},
			zls = {},
		}

		local ensure_installed = vim.tbl_keys(servers)
		require('mason-lspconfig').setup {
			ensure_installed = ensure_installed,
			automatic_enable = false,
		}

		for server, config in pairs(servers) do
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end
	end,
}
