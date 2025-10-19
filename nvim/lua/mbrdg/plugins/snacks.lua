-- plugins/snacks.lua
-- quality-of-life picker collection

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    picker = {},
  },
  keys = {
    -- find
    { '<leader>fb', function() Snacks.picker.buffers() end, desc = '[F]ind [B]uffers' },
    { '<leader>ff', function() Snacks.picker.files() end, desc = '[F]ind [F]iles' },
    { '<leader>fg', function() Snacks.picker.git_files() end, desc = '[F]ind [G]it Files' },
    { '<leader>fr', function() Snacks.picker.recent() end, desc = '[F]ind [R]ecent' },
    -- grep
    { '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch by [G]rep' },
    {
      '<leader>sb',
      function() Snacks.picker.grep_buffers() end,
      desc = '[S]earch by grep in [B]uffers',
    },
    { '<leader>sb', function() Snacks.picker.lines() end, desc = '[S]earch [B]uffer Lines' },
    -- git
    { '<leader>gb', function() Snacks.picker.git_branches() end, desc = '[G]it [B]ranches' },
    { '<leader>gl', function() Snacks.picker.git_log() end, desc = '[G]it [L]og' },
    { '<leader>gs', function() Snacks.picker.git_status() end, desc = '[G]it [S]tatus' },
    { '<leader>gS', function() Snacks.picker.git_stash() end, desc = '[G]it [S]tash' },
    { '<leader>gd', function() Snacks.picker.git_diff() end, desc = '[G]it [d]iff' },
    -- search
    { '<leader>s"', function() Snacks.picker.registers() end, desc = '[S]earch [R]egisters' },
    {
      '<leader>sd',
      function() Snacks.picker.diagnostics() end,
      desc = '[S]earch all [D]iagnostics',
    },
    {
      '<leader>sD',
      function() Snacks.picker.diagnostics_buffer() end,
      desc = '[S]earch buffer [D]iagnostics',
    },
    -- lsp (declaration != definition, e.g., in C declaration would go to the header)
    { 'grd', function() Snacks.picker.lsp_definitions() end, desc = 'LSP [G]oto [D]efinition' },
    {
      'gri',
      function() Snacks.picker.lsp_implementations() end,
      desc = 'LSP [G]oto [I]mplementation',
    },
    { 'grD', function() Snacks.picker.lsp_declarations() end, desc = 'LSP [G]oto [D]eclaration' },
    {
      'grr',
      function() Snacks.picker.lsp_references() end,
      nowait = true,
      desc = 'LSP [G]oto [R]eferences',
    },
    {
      'grt',
      function() Snacks.picker.lsp_type_definitions() end,
      desc = 'LSP [G]oto [T]ype Definition',
    },
    { 'gO', function() Snacks.picker.lsp_symbols() end, desc = 'LSP [O]pen Symbols' },
    {
      'gW',
      function() Snacks.picker.lsp_workspace_symbols() end,
      desc = 'LSP [W]orkspace Symbols',
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        Snacks.toggle.diagnostics():map('<leader>td')
        Snacks.toggle.inlay_hints():map('<leader>th')
      end,
    })
  end,
}
