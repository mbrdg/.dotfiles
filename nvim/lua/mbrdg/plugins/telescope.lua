-- plugins/telescope.lua
-- file and symbol finder

return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- fuzzy finder algorithm that requires local deps to be built
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    local km = vim.keymap
    km.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    km.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    km.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    km.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    km.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    km.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    km.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    km.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    km.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    km.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    km.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    km.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })
  end,
}
