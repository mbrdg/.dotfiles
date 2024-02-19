-- plugins/autocompletion.lua
-- autocompletion configuration

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- snippet engine
    {
      'L3MON4D3/LuaSnip',
      build = (function() 
	return 'make install_jsregexp'
      end)()
    },
    'saadparwaiz1/cmp_luasnip',

    -- adds lsp completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',

    -- user-friendly snippets
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
	expand = function(args)
	  luasnip.lsp_expand(args.body)
	end,
      },
      completion = {
	completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert {
	['<C-n>'] = cmp.mapping.select_next_item(),
	['<C-p>'] = cmp.mapping.select_prev_item(),
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	
	['<C-Space>'] = cmp.mapping.complete {},

	['<CR>'] = cmp.mapping.confirm {
	  behavior = cmp.ConfirmBehavior.Replace,
	  select = true,
	},

	['<Tab>'] = cmp.mapping(function(fallback)
	  if cmp.visible() then
	    cmp.select_next_item()
	  elseif luasnip.expand_or_locally_jumpable() then
	    luasnip.expand_or_jump()
	  else
	    fallback()
	  end
	end, { 'i', 's' }),

	['<S-Tab>'] = cmp.mapping(function(fallback)
	  if cmp.visible() then
	    cmp.select_prev_item()
	  elseif luasnip.locally_jumpable(-1) then
	    luasnip.jump(-1)
	  else
	    fallback()
	  end
	end, { 'i', 's' }),
      },
      sources = {
	{ name = 'nvim-lsp' },
      },
    }
  end
}
