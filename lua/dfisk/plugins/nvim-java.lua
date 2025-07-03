-- https://github.com/nvim-java/nvim-java
-- https://github.com/nvim-java/nvim-java/issues/374
-- https://github.com/nvim-java/nvim-java/issues/384
-- DISABLING FOR NOW - THIS PLUGIN IS NOT REALLY MAINTAINED WELL
return {
  'nvim-java/nvim-java',
  priority = 100,
  enabled = false,
  config = function()
    require('java').setup()
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
