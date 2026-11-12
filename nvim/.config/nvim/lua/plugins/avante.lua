vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'avante.nvim' and (kind == 'install' or kind == 'update') then vim.system({ 'make' }, { cwd = ev.data.path }):wait() end
  end,
})

vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/ColinKennedy/mega.logging',
  'https://github.com/ColinKennedy/mega.cmdparse',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/avante-corp/avante.nvim',
  { src = 'https://github.com/zbirenbaum/copilot.lua', version = 'v2.0.4' },

  -- Optional deps
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  'https://github.com/hrsh7th/nvim-cmp',
  'https://github.com/HakonHarnes/img-clip.nvim',
  'https://github.com/folke/snacks.nvim', -- for modern input UI
}

require('copilot').setup {
  suggestion = { enabled = false },
  panel = { enabled = false },
  server = { type = 'binary' },
}

require('render-markdown').setup {
  file_types = { 'markdown', 'Avante' },
}

require('avante').setup {
  provider = 'copilot',
  hints = { enabled = false },
}
