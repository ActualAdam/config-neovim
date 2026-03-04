return  {
  -- Additional lua configuration, makes nvim stuff amazing
  {
    "folke/neodev.nvim",
    dependencies = {
      "nvim-neotest/neotest"
    },
    config = function()
      require('neodev').setup {
        library = {
          plugins = {
            "neotest"
          },
          types = true,
        }
      }
    end
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },

}
