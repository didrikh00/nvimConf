return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gwrite", "Gread" },
    config = function()
    vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" })
    vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git Diff Split" })
    vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git Blame" })
    vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", { desc = "Git Add File" })
  end,
  },
}
