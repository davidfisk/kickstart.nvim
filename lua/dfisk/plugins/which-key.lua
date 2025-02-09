return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup {
      preset = 'helix',
    }

    -- Document existing key chains
    -- v3 keybindings
    require('which-key').add {
      { '<leader>a', group = '[A]erial LSP Symbols' },
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>g', group = '[G]it' },
      -- { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>r', group = '[R]est' }, -- TODO enable this only for http files
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]ab' },
      { '<leader>x', group = 'Trouble' },
      { '<leader>n', group = '[N]vimTree/[N]otify' },
      { '<leader>u', group = '[U]tility' },
    }
  end,
}
