vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
local barbar_tree_offset = require 'custom.plugins.utils.barbar-tree-offset'

return {
  {
    'rmagatti/auto-session',
    lazy = false,
    --dependencies = {
    --  'nvim-telescope/telescope.nvim', -- Only needed if you want to use session lens
    --},

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      --log_level = 'debug',
      auto_restore_last_session = true,
      cwd_change_handling = true,
      post_restore_cmds = { -- require open nvim-tree on restore session
        barbar_tree_offset.open_nvim_tree_no_focus,
      },
      no_restore_cmds = {
        barbar_tree_offset.open_nvim_tree_no_focus,
      },
      pre_cwd_changed_cmds = {
        '%bw!',
        function()
          require('nvim-tree.api').tree.close()
        end,
      },
      post_cwd_changed_cmds = {
        barbar_tree_offset.open_nvim_tree_no_focus,
      },
    },
  },
}
