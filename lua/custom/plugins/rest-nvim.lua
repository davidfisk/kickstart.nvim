return {
  'rest-nvim/rest.nvim',
  config = function()
    -- vim.g.rest_nvim = {}
    vim.keymap.set('n', '<leader>rr', ':Rest run<CR>', { desc = '[R]est [R]un' })
    vim.keymap.set('n', '<leader>rl', ':Rest logs<CR>', { desc = '[R]est [L]ogs' })
    vim.keymap.set('n', '<leader>rc', ':Rest cookies<CR>', { desc = 'Edit [R]est [C]ookies' })
    require('telescope').load_extension 'rest'
    --
    vim.keymap.set('n', '<leader>se', require('telescope').extensions.rest.select_env, { desc = '[S]earch Rest [E]nvs' })
  end,
}
