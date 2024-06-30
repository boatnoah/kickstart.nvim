-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Tmux plugin for moving around panes when in neovim
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
    },
  },

  -- A beatiful splash loading screen
  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {
        '      ',
        '      ',
        '      ',
        '      ',
        '      ',
        '      ',
        '      ',
        '      ',
        '  ⟋|､',
        ' (°､ ｡ 7',
        ' |､  ~ヽ',
        ' じしf_,)〳',
      }

      dashboard.section.buttons.val = {
        {
          type = 'button',
          val = 'Find Files',
          on_press = function()
            local key = vim.api.nvim_replace_termcodes('<leader>ff', true, false, true)
            vim.api.nvim_feedkeys(key, 'normal', false)
          end,
          opts = {
            position = 'center',
            shortcut = 'SPC f f',
            cursor = 5,
            width = 22,
            align_shortcut = 'right',
            hl_shortcut = 'AlphaShortcut',
          },
        },
        {
          type = 'button',
          val = 'Find Word',
          on_press = function()
            local key = vim.api.nvim_replace_termcodes('<leader>fw', true, false, true)
            vim.api.nvim_feedkeys(key, 'normal', false)
          end,
          opts = {
            position = 'center',
            shortcut = 'SPC f w',
            cursor = 5,
            width = 22,
            align_shortcut = 'right',
            hl_shortcut = 'AlphaShortcut',
          },
        },
      }

      alpha.setup(dashboard.opts)
    end,
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
  -- changes in source
  {
    'ThePrimeagen/vim-be-good',
  },
}
