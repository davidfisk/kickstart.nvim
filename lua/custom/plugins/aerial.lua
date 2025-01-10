return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  config = function()
    require("aerial").setup({
      layout = {
        default_direction = "right",
        min_width = 20,
      },
      open_automatic = true,
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "<leader>a{", "<cmd>AerialPrev<CR>", { desc = "[A]erial Next", buffer = bufnr })
        vim.keymap.set("n", "<leader>a}", "<cmd>AerialNext<CR>", { desc = "[A]erial Previous", buffer = bufnr })
      end,
    })
    -- You probably also want to set a keymap to toggle aerial
    vim.keymap.set("n", "<leader>aa", "<cmd>AerialToggle!<CR>", { desc = 'Toggle [A]erial' })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
}
