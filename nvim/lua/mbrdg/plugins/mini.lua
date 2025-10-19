-- plugins/mini.lua
-- collection of several small independent plugins

return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    local statusline = require('mini.statusline')
    statusline.setup({ use_icons = false })
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    require('mini.extra').setup()

    local hipatterns = require('mini.hipatterns')
    local hi_words = MiniExtra.gen_highlighter.words
    hipatterns.setup({
      highlighters = {
        fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
        hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
        todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
        note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })

    require('mini.misc').setup()
    MiniMisc.setup_restore_cursor()
    MiniMisc.setup_termbg_sync()

    local indentscope = require('mini.indentscope')
    indentscope.setup({
      draw = { animation = indentscope.gen_animation.none() },
    })

    require('mini.pairs').setup({ modes = { command = true } })

    require('mini.ai').setup()
    require('mini.surround').setup()
    require('mini.trailspace').setup()

    require('mini.git').setup()
    require('mini.diff').setup({ view = { style = 'sign' } })
  end,
}
