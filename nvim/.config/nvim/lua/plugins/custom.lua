return {
 {
   "tzachar/cmp-tabnine",
    build = './install.sh',
    dependencies = 'hrsh7th/nvim-cmp',
    config = function()
      require("cmp_tabnine.config"):setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = '..',
        ignored_file_types = {
          -- default is not to ignore
          -- uncomment to ignore in lua:
          -- lua = true
        },
        show_prediction_strength = false
      }
    end
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" }
  },
  {
    'glacambre/firenvim',
    build = function()
      vim.fn['firenvim#install'](0)
    end,

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    cond = not not vim.g.started_by_firenvim
  },
  {
    'martineausimon/nvim-lilypond-suite',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require('nvls').setup({
        lilypond = {
          compile = "<leader>lc"
        }
      })
    end
  }
}
