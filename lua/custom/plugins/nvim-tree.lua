-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        disable_netrw = true,
        view = {
          adaptive_size = true,
          float = {
            enable = true,
          },
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      }
      -- configure nvim-tree
      -- optionally enable 24-bit colour
      vim.opt.termguicolors = true

      -- setup keymaps
      vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>', { desc = 'Ope[n] [N]vimTree' })
      vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>', { desc = '[N]vimTree [F]ind' })

      -- open nvim-tree on setup
      local function open_nvim_tree(data)
        -- buffer is a [No Name]
        local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

        -- buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1

        if not no_name and not directory then
          return
        end

        -- change to the directory
        if directory then
          vim.cmd.cd(data.file)
        end

        -- open the tree
        require('nvim-tree.api').tree.open()
      end

      vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
    end,
  },
}
