return {
  -- 'navarasu/onedark.nvim', -- Theme inspired by Atom

  { "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "latte"
        -- flavour = "macchiato"
      })
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
