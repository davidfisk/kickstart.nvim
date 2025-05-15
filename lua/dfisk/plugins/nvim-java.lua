-- https://github.com/nvim-java/nvim-java
-- https://github.com/nvim-java/nvim-java/issues/374
return {
  'nvim-java/nvim-java',
  priority = 100,
  config = function()
    require('java').setup {
      -- temporarily call out version
      jdtls = {
        version = 'v1.46.1',
      },
    }
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
