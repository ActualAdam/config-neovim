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
        flavour = "macchiato",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          fidget = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          markdown = true,
          mason = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          }
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
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
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        filters = {
          dotfiles = true,
        }
      }
    end,
  },

  {
    'stevearc/dressing.nvim',
    opts = {},
    config = function()
      local dressing = require("dressing")
      dressing.setup {}
    end
  },

}
