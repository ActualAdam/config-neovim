return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    configure = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {
            "^.git/",
            "^target",
          },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = { "fd", "--type", "f" },
            hidden = true,
          }
        },
        extensions = {
          file_browser = {
            hidden = true,
          },
          project = {
            hidden_files = true,
          }
        }
      }
    end
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable "make" == 1
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },

  {
    "nvim-telescope/telescope-project.nvim"
  },
}
