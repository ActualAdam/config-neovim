return {
  'navarasu/onedark.nvim', -- Theme inspired by Atom

  { -- Fancier statusline
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'onedark',
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
