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
  },
  {
    'piersolenski/import.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    opts = {
      picker = "telescope",
      custom_languages = {
        {
          extensions = { "kotlin" },
          filetypes = { "kotlin", "java" },
          regex = [[^import\s+(.*)]],
          insert_at_line = 3,
        },
      },
    },
    keys = {
      {
        "<leader>i",
        function() require("import").pick() end,
        desc = "Import",
      },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      local conform = require("conform")
      local web_formatters = { "prettierd", "prettier", stop_after_first = true }

      conform.setup({
        formatters_by_ft = {
          css = web_formatters,
          html = web_formatters,
          javascript = web_formatters,
          javascriptreact = web_formatters,
          json = web_formatters,
          jsonc = web_formatters,
          kotlin = { "ktfmt" },
          less = web_formatters,
          markdown = web_formatters,
          scss = web_formatters,
          typescript = web_formatters,
          typescriptreact = web_formatters,
          yaml = web_formatters,
        },
        format_on_save = {
          timeout_ms = 5000,
          lsp_fallback = true,
        },
      })

      vim.api.nvim_create_autocmd("InsertLeave", {
        group = vim.api.nvim_create_augroup("WebFormatOnInsertLeave", { clear = true }),
        pattern = "*",
        callback = function(event)
          local web_filetypes = {
            css = true,
            html = true,
            javascript = true,
            javascriptreact = true,
            json = true,
            jsonc = true,
            less = true,
            scss = true,
            typescript = true,
            typescriptreact = true,
          }

          local bufnr = event.buf
          if not web_filetypes[vim.bo[bufnr].filetype] then
            return
          end
          if not vim.bo[bufnr].modifiable or vim.bo[bufnr].readonly or not vim.bo[bufnr].modified then
            return
          end

          conform.format({
            bufnr = bufnr,
            async = true,
            lsp_fallback = true,
            timeout_ms = 5000,
          })
        end,
      })

      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 5000,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end
  },

  {
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
          filetypes = {
            "css",
            "html",
            "javascriptreact",
            "scss",
            "typescriptreact",
          },
        },
      })
    end,
  },

  {
    "barrettruth/live-server.nvim",
    ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact" },
    keys = {
      { "<leader>ls", "<cmd>LiveServerToggle<cr>", desc = "Toggle live server" },
      { "<leader>lS", "<cmd>LiveServerStart<cr>", desc = "Start live server" },
      { "<leader>lx", "<cmd>LiveServerStop<cr>", desc = "Stop live server" },
    },
  },

}
