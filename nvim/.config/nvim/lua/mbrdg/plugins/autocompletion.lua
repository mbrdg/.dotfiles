-- plugins/autocompletion.lua

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- snippet engine
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    -- adds lap completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    -- user-friendly snippets
    'rafamadriz/friendly-snippets',
  },
}

