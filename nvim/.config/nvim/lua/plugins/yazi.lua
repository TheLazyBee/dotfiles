local gh = require('config.pack').gh

vim.pack.add {
  gh 'nvim-lua/plenary.nvim',
  gh 'mikavilpas/yazi.nvim',
}

require('yazi').setup {
  open_for_directories = true,
}

vim.keymap.set('n', '<leader>e', '<cmd>Yazi<CR>', { desc = '[Y]azi at current file' })
vim.keymap.set('n', '<leader>E', '<cmd>Yazi cwd<CR>', { desc = '[Y]azi in cwd' })
