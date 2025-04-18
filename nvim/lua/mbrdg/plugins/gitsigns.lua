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
			local gitsigns = require('gitsigns')
			local map = function(mode, lhs, rhs, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, lhs, rhs, opts)
			end

			-- navigation
			map('n', ']c', function()
				if vim.wo.diff then
					vim.cmd.normal({ ']c', bang = true })
				else
					gitsigns.nav_hunk('next')
				end
			end, { desc = 'Jump to next hunk' })

			map('n', '[c', function()
				if vim.wo.diff then
					vim.cmd.normal({ '[c', bang = true })
				else
					gitsigns.nav_hunk('prev')
				end
			end, { desc = 'Jump to previous hunk' })

			-- actions
			-- visual mode
			map('v', '<leader>hs', function()
				gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
			end, { desc = 'Git [s]tage hunk' })
			map('v', '<leader>hr', function()
				gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
			end, { desc = 'Git [r]eset hunk' })

			-- normal mode
			map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git [s]tage hunk' })
			map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git [r]eset hunk' })
			map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Git [S]tage buffer' })
			map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git [R]eset buffer' })
			map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git [p]review hunk' })
			map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Git preview [h]unk [i]nline' })

			map('n', '<leader>hb', function()
				gitsigns.blame_line { full = true }
			end, { desc = 'Git [b]lame line' })

			map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git [d]iff against index' })
			map('n', '<leader>hD', function()
				gitsigns.diffthis '~'
			end, { desc = 'Git [D]iff against last commit' })

			map('n', '<leader>hQ', function()
				gitsigns.setqflist('all')
			end, { desc = 'Git repo [Q]uickfix list ' })
			map('n', '<leader>hq', gitsigns.setqflist, { desc = 'Git buffer [q]uickfix list' })

			-- toogles
			map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Git [t]oogle [b]lame line' })
			map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'Git [t]oogle [w]ord diff' })

			-- text objects
			map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'Select hunk' })
		end,
	},
}
