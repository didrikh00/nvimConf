vim.opt.termguicolors = true -- Enable 24 bit colors
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins

require("lazy").setup({
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
  },
  -- Tresistter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Only enable highlighting if tresitter loaded
      local ok, tsconfigs = pcall(require, "nvim-tresitter.configs")
      if not ok then
        return
      end
      tsconfigs.setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
  },

  -- Telescope --
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if not ok then
        return
      end

      telescope.setup({
        defaults = {
          file_ignore_patterns = {"node_modules", ".git/"},
        },
      })
	end,
  },
	-- Lualine --
  {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local ok, lualine = pcall(require, "lualine")
    if not ok then
      return
    end

    lualine.setup({
      options = {
        theme = "sonokai",       -- match your colorscheme
        section_separators = "", 
        component_separators = "|",
        globalstatus = true,     -- full-width statusline
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { 
          { "filename", path = 1 } -- 0=filename, 1=relative path, 2=absolute path
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
},
  -- LSP config
{
  "neovim/nvim-lspconfig",
  config = function()
    local ok, lspconfig = pcall(require, "lspconfig")
    if not ok then
      return
    end

    -- Basic diagnostic
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
    })

    -- SystemVerilog LSP
    vim.lsp.config("svlangserver",{
      filetypes = {"systemverilog", "verilog", "sv", "svh"},
      
      --root directorty detection
      root_dir = function(fname)
        local util = require("lspconfig.util")
        return util.root_pattern("rtl", "src", ".git")(fname)
          or vim.fn.fetcwd()
      end,
      settings = {
        systemverilog = {
        includeIndexing = { "*.*" },
        excludeIndexing = {".git/*", "*/.vscode/*"},
        defines = {},
        incdirs = {},
        },
      },
    })

    --start it
    vim.lsp.start({
      name = "svlangserver",
      cmd = {"svlangserver"},
    })
    end,
  },

  -- Indent guidlines --
  {
    "lukas-reineke/indent-blankline.nvim",
    main =  "ibl",
    config = function()
      local ok, ibl = pcall(require, "ibl")
      if not ok then
        return
      end

      ibl.setup({
        indent = {
          char = "|",
          tab_char = "|",
        },
        scope = {
          enabled = true,
        },
      })
    end,
  },

},

  {
    git = {
      url_format = "git@github.com:%s.git"
    },
})

vim.g.sonokai_style = "default"
vim.cmd([[colorscheme sonokai]])
