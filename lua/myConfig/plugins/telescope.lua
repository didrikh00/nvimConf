return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim", -- optional, faster fzf sorter
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    pcall(telescope.load_extension, "fzf")

    -- Keymaps --
    local builtin = require("telescope.builtin")
    local map = vim.keymap.set

    map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
    map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
    map("n", "<leader>fw", builtin.grep_string, { desc = "Grep Current Word" })
    map("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
    map("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
  end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable("make") == 1,
  },
}

