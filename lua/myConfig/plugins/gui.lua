return {
  {
    "sainnhe/everforest",
    lazy = false,         -- load immediately
    priority = 1000,      -- load before other plugins like Lualine
    config = function()
      -- optional settings
      vim.g.everforest_background = "hard"   -- options: soft, medium, hard
      vim.g.everforest_better_performance = 1
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_diagnostic_text_highlight = 1
      vim.g.everforest_diagnostic_line_highlight = 1
      vim.g.everforest_diagnostic_virtual_text = "colored"

      -- set the colorscheme
      vim.cmd("colorscheme everforest")
    end,
  },
}
