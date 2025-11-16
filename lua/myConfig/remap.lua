-- Leader setup --
vim.g.mapleader = " "
vim.g.maplocalleader = " "




-- Telescope --
local map = vim.keymap.set
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
  
-- Git --
--_G.git_signs_enabled = true
--function _G.toggle_gitsigns()
--  local ok, gitsigns = pcall(require,"gitsigns")
--  if not ok then
--    return
--  end
--  _G.git_signs_enabled = not _G.git_signs_enabled
--  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--    if vim.api.nvim_buf_is_loaded(buf) then
--      gitsigns.toggle_signs(_G.git_signs_enabled, { buffer = buf})
--      gitsigns.toggle_deleted(_G.git_signs_enabled, { buffer = buf})
--    end
--  end
--  if _G.git_signs_enabled then
--    print("Git signs enabled")
--  else
--    print("Git signs disabled")
--  end
--end

--vim.keymap.set("n","<leader>gt", ":lua toggle_gitsigns()<CR>", {desc = "Toggle git signs"})

vim.keymap.set("n","<leader>gb", function()
  local gs = require("gitsigns")
  gs.toggle_current_line_blame()
end, {desc = "Toggle git line blame" })




