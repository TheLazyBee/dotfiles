local gh = require('config.pack').gh

vim.pack.add {
  gh 'nvim-lua/plenary.nvim', -- dependency; harmless if already installed
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
}

local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>h', function() harpoon:list():add() end, { desc = 'Harpoon: [A]dd file' })
vim.keymap.set('n', '<leader>m', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon: [M]enu' })

vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = 'Harpoon file 1' })
vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = 'Harpoon file 2' })
vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = 'Harpoon file 3' })
vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, { desc = 'Harpoon file 4' })
vim.keymap.set('n', '<leader>5', function() harpoon:list():select(5) end, { desc = 'Harpoon file 5' })
