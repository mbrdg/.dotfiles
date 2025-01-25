-- plugins/gitsigns.lua
-- configuration file for git hints on the side bar

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
      -- do not overrride the built-in and fugitive keymaps
      local gs = package.loaded.gitsigns
      local map = function(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- navigation
      map('n', ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'Jump to next hunk' })

      map('n', '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'Jump to previous hunk' })

      -- actions
      -- visual mode
      map('v', '<leader>hs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git [s]tage hunk' })
      map('v', '<leader>hr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git [r]eset hunk' })

      -- normal mode
      map('n', '<leader>hs', gs.stage_hunk, { desc = 'Git [s]tage hunk' })
      map('n', '<leader>hr', gs.reset_hunk, { desc = 'Git [r]eset hunk' })
      map('n', '<leader>hS', gs.stage_buffer, { desc = 'Git [S]tage buffer' })
      map('n', '<leader>hR', gs.reset_buffer, { desc = 'Git [R]eset buffer' })
      map('n', '<leader>hp', gs.preview_hunk, { desc = 'Git [p]review hunk' })
      map('n', '<leader>hi', gs.preview_hunk_inline, { desc = 'Git preview [h]unk [i]nline' })

      map('n', '<leader>hb', function()
        gs.blame_line { full = true }
      end, { desc = 'Git [b]lame line' })

      map('n', '<leader>hq', gs.setqflist, { desc = 'Git [q]uickfix list' })
      map('n', '<leader>hd', gs.diffthis, { desc = 'Git [d]iff against index' })
      map('n', '<leader>hD', function()
        gs.diffthis '~'
      end, { desc = 'Git [D]iff against last commit' })

      -- toogles
      map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Git [t]oogle [b]lame line' })
      map('n', '<leader>td', gs.toggle_deleted, { desc = 'Git [t]oogle [d]eleted' })
      map('n', '<leader>tw', gs.toggle_word_diff, { desc = 'Git [t]oogle [w]ord diff' })

      -- text objects
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
    end,
  },
}
