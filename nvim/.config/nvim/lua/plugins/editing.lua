return {
  -- indentation guides
  -- See `:help indent_blankline.txt`
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        char = "┊",
        show_trailing_blankline_indent = false,
      }
    end
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
    confing = function()
      require("hex").setup()
    end
  }

}
