return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-tree/nvim-web-devicons"
  },
    config = function()

      require("oil").setup({
        default_file_explorer = true,
        view_options = { show_hidden = true},
        icons = false,
      })
      vim.keymap.set("n", "<leader>n", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open Oil" })
    end,
  },
}

