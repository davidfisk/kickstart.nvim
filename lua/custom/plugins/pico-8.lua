on_attach = function(current_client, bufnr)
  print 'inside on_attach for pico-8'
end

vim.api.nvim_create_autocmd({ 'BufNew', 'BufEnter' }, {
  pattern = { '*.p8' },
  callback = function(args)
    vim.lsp.start {
      name = 'pico8-ls',
      cmd = { 'pico8-ls', '--stdio' },
      root_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(args.buf)),
      -- Setup your keybinds in the on_attach function
      on_attach = on_attach,
    }
  end,
})

print 'setting up treesitter'
vim.treesitter.language.register('lua', 'p8')
vim.treesitter.language.register('lua', 'pico8')
print 'done setting up treesitter'

vim.filetype.add { extension = { p8 = 'pico8' } }
return {}
