return {
  'nvim-java/nvim-java',
  priority = 100,
  config = function()
    require('lspconfig').jdtls.setup = {
      java = {
        format = {
          enabled = true,
        },
        tabSize = 4,
        insertSpaces = true,
      },
    }
  end,
}
