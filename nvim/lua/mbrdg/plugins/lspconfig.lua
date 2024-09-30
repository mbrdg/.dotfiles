-- plusing/lspconfig.lua
-- lsp configuration file

return {
  -- lsp configuration and plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- automatically install lsps to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- status updates
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    local km = vim.keymap

    -- diagnostics
    km.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
    km.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(mode, keys, func, desc)
          km.set(mode, keys, func, { buffer = event.buf, desc = 'LSP' .. desc })
        end

        local builtin = require 'telescope.builtin'
        map('n', 'gd', builtin.lsp_definitions, '[G]oto [D]efinition')
        map('n', 'gr', builtin.lsp_references, '[G]oto [R]eferences')
        map('n', 'gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
        map('n', '<leader>D', builtin.lsp_type_definitions, '[T]ype [D]efinition')
        map('n', '<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
        map('n', '<leader>ws', builtin.lsp_workspace_symbols, '[W]orkspace [S]ymbols')

        map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
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

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('n', '<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oogle Inlay [H]ints')
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- enables language servers
    local servers = {
      clangd = {},
      gopls = {},
      pyright = {},
      rust_analyzer = {},
      zls = {},
      lua_ls = {
        Lua = {
          completion = { callSnippet = 'Replace' },
          telemetry = { enable = false },
        },
      },
    }

    -- mason-lspconfig requies these function to be called before setting up the servers
    -- these funstions must be called in this order
    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- used to format the lua code
      'clang-format', -- used to format code in c or c++
    })

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})

          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
