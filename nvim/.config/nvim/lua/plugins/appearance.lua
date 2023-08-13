return {
  -- 'navarasu/onedark.nvim', -- Theme inspired by Atom

  { "f-person/auto-dark-mode.nvim",
    config = function()
      require("auto-dark-mode").setup({
        update_interval = 1000,
        set_dark_mode = function()
          vim.api.nvim_set_option('background', 'dark')
          vim.cmd('colorscheme catppuccin-mocha')
        end,
        set_light_mode = function()
          vim.api.nvim_set_option('background', 'light')
          vim.cmd('colorscheme catppuccin-latte')
        end,
      })
    end
  },
  { "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        -- flavour = "latte"
        flavour = "macchiato"
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
