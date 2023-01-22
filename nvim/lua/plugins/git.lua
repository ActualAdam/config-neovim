return {
  -- :Git for a git client
  "tpope/vim-fugitive",

  -- :GBrowse to open buffer in Github
  "tpope/vim-rhubarb",

  -- permalinks for popular git service providers
  -- <leader>gy to generate permalinks for current line or visual selection
  -- <leader>gY for a link to the repo 
  {
    "ruifm/gitlinker.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function ()
      require("gitlinker").setup()
    end
  },

  -- git decorations in the gutter
  {"lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      }
    end,
  },
}
