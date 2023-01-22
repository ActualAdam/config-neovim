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

  -- :Glow for mardkdown preview
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup()
    end
  }
}
