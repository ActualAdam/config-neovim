local lsp = {}

-- Language servers that implement LSP will be automatically installed if they are named here.
-- You have to use these nvim_lsp names though.
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
lsp.servers = {
  -- clangd = {},
  pyright = {}, -- python
  ansiblels = {},
  rust_analyzer = {},
  taplo = {}, -- toml
  tsserver = {}, -- typescript
  jsonls = {},
  jdtls = {}, -- java
  kotlin_language_server = {},
  clojure_lsp = {},
  gopls = {},
  golangci_lint_ls = {},
  marksman = {}, -- markdown
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  -- tailwindcss = {},
  svelte = {},
  lemminx = {
    -- validation = {
    --   noGrammar= "hint",
    --   enabled = true,
    --   schema = true,
    -- }
  }, -- xml
  sqlls = {},
  terraformls = {},
  tflint = {},
  yamlls = {},
}

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
lsp.on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  local tb = require('telescope.builtin')
  nmap('<leader>gd', '<cmd> Telescope lsp_definitions<cr>', '[g]oto [d]efinition')
  nmap('<leader>gr', '<cmd> Telescope lsp_references<cr>', '[g]oto [r]eferences')
  nmap('<leader>gI', '<cmd> Telescope lsp_implementations<cr>', '[G]oto [I]mplementation')
  nmap('<leader>D', '<cmd> Telescope lsp_type_definitions<cr>', 'Type [D]efinition')
  nmap('<leader>ds', '<cmd> Telescope lsp_document_symbols<cr>', '[D]ocument [S]ymbols')
  nmap('<leader>ws', '<cmd> Telescope lsp_dynamic_workspace_symbols<cr>', '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

return lsp
