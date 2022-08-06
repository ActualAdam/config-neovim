local init = {}

local configs_by_server = {
    jsonls = {},
    rust_analyzer = {},
    sumneko_lua = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    },
    kotlin_language_server = {},
    tsserver = {},  -- javascript and typescript
    marksman = {},  -- mardkdown 
    vimls = {},
    yamlls = {},
}

local common_config = {
    on_attach = function(client, bufnr)
        -- Enable completion triggered by <C-X><C-O>
        -- See `:help omnifunc` and `:help ins-completion` for more information.
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Use LSP as the handler for formatexpr.
        -- See `:help formatexpr` for more information.
        vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

        -- Configure key mappings
        require("config.lsp.keymaps").setup(client, bufnr)
    end,
    flags = {
        debounce_text_changes = 150,
    },
}


local lsp_signature = require("lsp_signature")

lsp_signature.setup {
    bind = true,
    handler_opts = {
        border = "rounded",
    },
}

-- mutates the server_configs
local function apply_to_each(server_configs, applicant)
    for _, config in pairs(server_configs) do
        for k, v in pairs(applicant) do
            config[k] = v
        end
    end
    return server_configs
end

local enhanced_configs = apply_to_each(configs_by_server, common_config)

local function apply_coq(server_configs)
    local coq = require("coq")
    for server, config in pairs(server_configs) do
        server_configs[server] = coq.lsp_ensure_capabilities(config)
    end
    return server_configs
end

local coqd_configs = apply_coq(enhanced_configs)

function init.setup()
    --    require("config.lsp.installer").setup(servers, opts)
    local lsp_installer_servers = require("nvim-lsp-installer.servers")
    local utils = require("utils")

    local function setup(configs)
        for server_name, _ in pairs(configs) do
            local server_available, server = lsp_installer_servers.get_server(server_name)

            if server_available then
                server:on_ready(function()
                    local opts = configs[server.name] or {}
                    -- server:setup(require("coq").lsp_ensure_capabilities(opts))
                    server:setup(opts)
                end)

                if not server:is_installed() then
                    utils.info("Installing " .. server.name)
                    server:install()
                end
            else
                utils.error(server)
            end
        end
    end
    setup(coqd_configs)
end

return init
