return {
  -- indentation guides
  -- See `:help indent_blankline.txt`
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = "nvim-treesitter",
    main = "ibl",
    config = function()
--       local highlight = {
--         "RainbowRed",
--         "RainbowYellow",
--         "RainbowBlue",
--         "RainbowOrange",
--         "RainbowGreen",
--         "RainbowViolet",
--         "RainbowCyan",
--       }
-- :
--       local hooks = require "ibl.hooks"
--       local palette = require("catppuccin.palettes").get_palette("mocha")
--       -- create the highlight groups in the highlight setup hook, so they are reset
--       -- every time the colorscheme changes
--       hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--         vim.api.nvim_set_hl(0, "RainbowRed", { fg = pallete })
--         vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
--         vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
--         vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
--         vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
--         vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
--         vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
--       end)
      require("ibl").setup({
      })
    end,
  },

  -- align commands
  {
    'echasnovski/mini.align',
    version = '*',
    config = function()
      require('mini.align').setup()
    end,
  },

  -- whitespace removal on save
  {
    "cappyzawa/trim.nvim",
    config = function()
      require("trim").setup()
    end,
  },


  -- "gc" to comment visual regions/lines
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  -- close braces, quotes, etc.
  {
    "windwp/nvim-autopairs",
    dependencies = {
      "nvim-treesitter"
    },
    event = "InsertEnter",
    config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup {
        check_ts = true
      }
      autopairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
    end,
  },

  -- :Glow for mardkdown preview in nvim
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup()
    end
  },

  -- markdown preview in browser
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- invoke a repl. probably this should get extracted
  {
    "hkupty/iron.nvim",
    config = function()
      local iron = require("iron.core")
      iron.setup {
        config = {
          repl_definition = {
            sh = {
              command = {"zsh"}
            },
            python = {
              command = function(meta)
                return {
                  "python3"
                }
              end
            },
            kotlin = {
              command = function(meta)
                return {
                  "kotlinc"
                }
              end
            },
            lua = {
              command = function(meta)
                return {
                  "lua"
                }
              end
            }
          },
          repl_open_cmd = require("iron.view").split.vertical.botright("40%"),
        }
      }
    end
  },

  {
    "RaafatTurki/hex.nvim",
    config = function()
      require("hex").setup()
    end
  },

  {
    "mechatroner/rainbow_csv"
  }

}
