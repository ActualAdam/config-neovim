return {
--  {
--    "tzachar/cmp-tabnine",
--     build = './install.sh',
--     dependencies = 'hrsh7th/nvim-cmp',
--     config = function()
--       require("cmp_tabnine.config"):setup {}
--     end
--   },
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
  }

}