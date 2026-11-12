local gh = require('config.pack').gh

vim.pack.add {
  gh 'nvim-lua/plenary.nvim',
  gh 'kdheepak/lazygit.nvim',
}

vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<Cr>', { desc = '[L]azy[G]it' })
