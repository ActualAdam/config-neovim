return {
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
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  }
}
