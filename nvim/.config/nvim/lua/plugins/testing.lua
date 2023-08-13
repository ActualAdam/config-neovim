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
  },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      "leoluz/nvim-dap-go",
      "jbyuki/one-small-step-for-vimkind",
      "mxsdev/nvim-dap-vscode-js",
      {
        "microsoft/vscode-js-debug",
        lazy = true,
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
      },
    },
    config = function()
      require("config.dap").setup()
    end,
    enabled = true,
  }
}
