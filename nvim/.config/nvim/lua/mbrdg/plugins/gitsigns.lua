-- plugins/gitsigns.lua

return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local km = vim.keymap
      km.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

      -- do not overrride the built-in and fugitive keymaps
      local gs = package.loaded.gitsigns
      local action = function(bind, callable) 
        if vim.wo.diff then
          return bind
        end

        vim.schedule(callable)
        return '<Ignore>'
      end

      km.set({ 'n', 'v' }, ']c', action(']c', gs.next_hunk), { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
      km.set({ 'n', 'v' }, '[c', action('[c', gs.prev_hunk), { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
    end
  },
}

