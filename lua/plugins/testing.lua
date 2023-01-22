return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-plenary",
      "rouge8/neotest-rust"
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require("neotest-plenary"),
          require("neotest-rust"),
        }
      }
    end,
  }
}
