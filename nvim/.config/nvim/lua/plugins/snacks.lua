local gh = require('config.pack').gh

vim.pack.add { gh 'folke/snacks.nvim' }

require('snacks').setup {
  input = { enabled = true },
  terminal = { enabled = true },
  dashboard = {
    enabled = true,
    preset = {
      header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                  
       ]],
      keys = {
        { icon = ' ', key = 'f', desc = 'Find File', action = ':Telescope find_files' },
        { icon = ' ', key = 'g', desc = 'Live Grep', action = ':Telescope live_grep' },
        { icon = ' ', key = 'r', desc = 'Recent Files', action = ':Telescope oldfiles' },
        { icon = ' ', key = 'c', desc = 'Config', action = ':Telescope find_files cwd=' .. vim.fn.stdpath 'config' },
        { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
      },
    },
    sections = {
      { section = 'header' },
      { section = 'keys', gap = 1, padding = 1 },
      { section = 'recent_files', limit = 8, padding = 1 },
    },
  },
}
