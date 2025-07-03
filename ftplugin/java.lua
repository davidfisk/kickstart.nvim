-- local mason_registry = require('mason-registry')
-- local lombok_jar = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"
-- /Users/dfisk/.local/share/nvim/mason/packages/jdtls/lombok.jar
-- /Users/dfisk/.local/share/nvim/mason/share/jdtls/lombok.jar
-- local lombok_jar = vim.fn.exepath 'jdtls' .. '/lombok.jar'
-- vim.print(vim.fn.globpath("$MASON/share/java-debug-adapter", "*.jar", true, true))
local lombok_jar = vim.fn.expand '$MASON/share/jdtls/lombok.jar'
print('retrived lombok path: ' .. lombok_jar)
-- "--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand "$MASON/share/jdtls/lombok.jar"),
local config = {
  cmd = {
    'jdtls',
    '--jvm-arg=' .. string.format('-javaagent:%s', vim.fn.expand '$MASON/share/jdtls/lombok.jar'),
  },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  settings = {
    runtimes = {
      -- determine runtime path on mac jenv with `jenv which 24`
      {
        name = 'jdk17',
        path = '$HOME/.jenv/versions/17.0/bin/java',
      },
      {
        name = 'jdk24',
        path = '$HOME/.jenv/versions/24/bin/java',
      },
    },
    java = {
      format = {
        enabled = true,
      },
      tabSize = 4,
      insertSpaces = true,
    },
    contentProvider = { preferred = 'fernflower' },
    implementationsCodeLens = {
      enabled = true,
    },
    referencesCodeLens = {
      enabled = true,
    },
    signatureHelp = { enabled = true },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
  },
}
require('jdtls').start_or_attach(config)
