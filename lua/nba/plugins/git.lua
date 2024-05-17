return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'VimEnter',
    opts = {
      signs = {
        add = { text = "" },
        change = { text = '┃' },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = '┆' },
      },
      watch_gitdir = {
        follow_files = true
      },
      on_attach = function()
        local gitsigns = require 'gitsigns'
        vim.keymap.set('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end, { desc = '[Next] [H]unk' })

        vim.keymap.set('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end, { desc = '[P]rev [H]unk' })
        vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[S]tage [H]unk' })
        vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[U]ndo [H]unk' })
        vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[R]eset [H]unk' })
        vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[P]review [H]unk' })
        vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, { desc = '[B]lame [L]ine' })
        vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = '[D]iff' })
        vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[U]ndo [H]unk' })
        vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[U]ndo [H]unk' })
      end
    },
  },
  {
    "tpope/vim-fugitive",
  },
}
