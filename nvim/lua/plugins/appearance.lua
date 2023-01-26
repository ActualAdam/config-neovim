return {
  -- 'navarasu/onedark.nvim', -- Theme inspired by Atom

  {
    "Shatur/neovim-ayu",
    config = function()
      local ayu = require("ayu")
      ayu.setup {
        mirage = false,
        overrides = {}
      }
      ayu.colorscheme()
    end
  },

  { -- Fancier statusline
    'nvim-lualine/lualine.nvim',
    dependencies = {
      "Shatur/neovim-ayu",
    },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'ayu',
          component_separators = '|',
          section_separators = '',
        },
      }
    end,
  },

  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end
  }
}
