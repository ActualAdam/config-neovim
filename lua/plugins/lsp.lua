return {

  -- LSP Configuration & Plugins
  {
    "neovim/nvim-lspconfig",
    dependencies = {

      -- Useful status updates for LSP
      "j-hui/fidget.nvim",

      "folke/neodev.nvim",
    },
  },

  {
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason.nvim",
    -- Setup mason so it can manage external tooling
    config = function()
      require('mason').setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      local my_lsp_config = require("config.lsp")
      local servers = my_lsp_config.servers
      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = my_lsp_config.on_attach,
            settings = servers[server_name],
          }
        end,
      }

    end
  },

}
