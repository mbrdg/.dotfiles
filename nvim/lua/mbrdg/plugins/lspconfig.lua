-- plusing/lspconfig.lua
-- lsp configuration file

return {
  -- lsp configuration and plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'saghen/blink.cmp',
  },
  config = function()
    -- diagnostics
    vim.diagnostic.config({ severity_sort = true })
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

    -- lsp attachment
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP' .. desc })
        end

        map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('gra', vim.lsp.buf.code_action, 'Code [A]ction', { 'n', 'x' })

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then return end

        if client:supports_method('textDocument/documentHighlight', event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-config', { clear = false })
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
              vim.api.nvim_clear_autocmds({ group = 'kickstart-lsp-highlight', buffer = event2.buf })
            end,
          })
        end

        if client:supports_method('textDocument/formatting', event.buf) then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = event.buf,
            callback = function() vim.lsp.buf.format({ bufnr = event.buf, id = client.id }) end,
          })
        end
      end,
    })

    -- language server configurations
    local servers = {
      rust_analyzer = {},
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              library = vim.env.RUNTIME,
              ignoreSubmodules = true,
            },
          },
        },
      },
    }

    for server, config in pairs(servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end,
}
