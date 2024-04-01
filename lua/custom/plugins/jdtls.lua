-- https://sookocheff.com/post/vim/neovim-java-ide/

-- return {
--   'mfussenegger/nvim-jdtls',
--   opts = {
--     jdtls = function(opts)
--       local install_path = require('mason-registry').get_package('jdtls'):get_install_path()
--       local jvmArg = '-javaagent:' .. install_path .. '/lombok.jar'
--       table.insert(opts.cmd, '--jvm-arg=' .. jvmArg)
--       return opts
--     end,
--   },
--   config = function()
--     -- do some stuff, does it still error
--   end,
-- }

-- return {
--   {
--     'neovim/nvim-lspconfig',
--     dependencies = { 'mfussenegger/nvim-jdtls' },
--     opts = {
--       setup = {
--         jdtls = function(_, opts)
--           vim.api.nvim_create_autocmd('FileType', {
--             pattern = 'java',
--             callback = function()
--               -- TODO update thiss for kickstart
--               -- require('lazyvim.util').on_attach(function(_, buffer)
--               --   vim.keymap.set('n', '<leader>di', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { buffer = buffer, desc = 'Organize Imports' })
--               --   vim.keymap.set('n', '<leader>dt', "<Cmd>lua require'jdtls'.test_class()<CR>", { buffer = buffer, desc = 'Test Class' })
--               --   vim.keymap.set('n', '<leader>dn', "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", { buffer = buffer, desc = 'Test Nearest Method' })
--               --   vim.keymap.set('v', '<leader>de', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { buffer = buffer, desc = 'Extract Variable' })
--               --   vim.keymap.set('n', '<leader>de', "<Cmd>lua require('jdtls').extract_variable()<CR>", { buffer = buffer, desc = 'Extract Variable' })
--               --   vim.keymap.set('v', '<leader>dm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { buffer = buffer, desc = 'Extract Method' })
--               --   vim.keymap.set('n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', { buffer = buffer, desc = 'Format' })
--               -- end)
--
--               local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--               -- vim.lsp.set_log_level('DEBUG')
--               -- TODO set this dynamically
--               local workspace_dir = '/home/dfisk/src/java/' .. project_name -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
--               local install_path = require('mason-registry').get_package('jdtls'):get_install_path()
--               print('detected install path ' .. install_path)
--               local config = {
--                 -- The command that starts the language server
--                 -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--                 cmd = {
--
--                   'java', -- or '/path/to/java17_or_newer/bin/java'
--                   -- depends on if `java` is in your $PATH env variable and if it points to the right version.
--                   -- '-Xbootclasspath/a:/home/jake/.local/share/java/lombok.jar',
--                   '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--                   '-Dosgi.bundles.defaultStartLevel=4',
--                   '-Declipse.product=org.eclipse.jdt.ls.core.product',
--                   '-Dlog.protocol=true',
--                   '-Dlog.level=ALL',
--                   '-javaagent:' .. install_path .. 'lombok.jar',
--                   -- '-noverify',
--                   '-Xms1g',
--                   '--add-modules=ALL-SYSTEM',
--                   '--add-opens',
--                   'java.base/java.util=ALL-UNNAMED',
--                   '--add-opens',
--                   'java.base/java.lang=ALL-UNNAMED',
--                   '-jar',
--                   vim.fn.glob '/Users/dfisk/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar',
--                   -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
--                   -- Must point to the                                                     Change this to
--                   -- eclipse.jdt.ls installation                                           the actual version
--
--                   '-configuration',
--                   '/Users/dfisk/.local/share/nvim/mason/packages/jdtls/config_mac',
--                   -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
--                   -- Must point to the                      Change to one of `linux`, `win` or `mac`
--                   -- eclipse.jdt.ls installation            Depending on your system.
--
--                   -- See `data directory configuration` section in the README
--                   '-data',
--                   workspace_dir,
--                 },
--
--                 -- This is the default if not provided, you can remove it. Or adjust as needed.
--                 -- One dedicated LSP server & client will be started per unique root_dir
--                 root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew' },
--
--                 -- Here you can configure eclipse.jdt.ls specific settings
--                 -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--                 -- for a list of options
--                 settings = {
--                   java = {},
--                 },
--                 handlers = {
--                   ['language/status'] = function(_, result)
--                     -- print(result)
--                   end,
--                   ['$/progress'] = function(_, result, ctx)
--                     -- disable progress updates.
--                   end,
--                 },
--               }
--               require('jdtls').start_or_attach(config)
--             end,
--           })
--           return true
--         end,
--       },
--     },
--   },
-- }
--
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'mfussenegger/nvim-jdtls',
    'mfussenegger/nvim-dap',
    'nvim-lua/plenary.nvim',
  },
  init = function()
    print 'init java server!'
    -- local jdtls = require 'jdtls'
    -- jdtls.setup_dap { hotcodereplace = 'auto' }
    -- jdtls.setup.add_commands()
    -- -- Auto-detect main and setup dap config
    -- require('jdtls.dap').setup_dap_main_class_configs {
    --   config_overrides = {
    --     -- vmArgs = "-Dspring.profiles.active=local",
    --   },
    -- }
  end,
  opts = {
    -- LSP Server Settings
    --- @type lspconfig.options
    setup = {
      jdtls = function(_, opts)
        -- calculate workspace dir
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
        local workspace_dir = vim.fn.stdpath 'data' .. '/site/java/workspace-root/' .. project_name
        os.execute('mkdir ' .. workspace_dir)
        local jdtls = require 'jdtls'

        -- get the mason install path
        local mason_registry = require 'mason-registry'
        local install_path = require('mason-registry').get_package('jdtls'):get_install_path()
        print('using install path ' .. install_path)
        local java_test_install_path = require('mason-registry').get_package('java-test'):get_install_path()

        -- get the current OS
        local os
        if vim.fn.has 'mac' == 1 then
          os = 'mac'
        elseif vim.fn.has 'unix' == 1 then
          os = 'linux'
        elseif vim.fn.has 'win32' == 1 then
          os = 'win'
        end

        local bundles = {
          mason_registry.get_package('java-debug-adapter'):get_install_path() .. '/extension/server/com.microsoft.java.debug.plugin-0.45.0.jar',
        }
        vim.list_extend(bundles, vim.split(vim.fn.glob(mason_registry.get_package('java-test'):get_install_path() .. '/extension/server/*.jar'), '\n'))

        -- vim.list_extend(bundles, vim.split(vim.fn.glob("/home/jemag/dev/vscode-java-test/server/*.jar"), "\n"))
        -- ensure that OS is valid
        if not os or os == '' then
          vim.notify('jdtls: Could not detect valid OS', vim.log.levels.ERROR)
        end
        local jdtls_opts = vim.tbl_deep_extend('force', opts, {
          cmd = {
            'java',
            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xms1g',
            '--add-modules=ALL-SYSTEM',
            '--add-opens',
            'java.base/java.util=ALL-UNNAMED',
            '--add-opens',
            'java.base/java.lang=ALL-UNNAMED',
            '-javaagent:/Users/dfisk/.local/share/nvim/mason/packages/jdtls/lombok.jar',
            '-jar',
            vim.fn.glob(install_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
            '-configuration',
            install_path .. '/config_' .. os,
            '-data',
            workspace_dir,
          },
          init_options = {
            bundles = bundles,
          },
          filetypes = { 'java' },
        })
        require 'lazyvim.plugins.lsp'
        jdtls.start_or_attach(jdtls_opts)
        return true
      end,
    },
  },
}
