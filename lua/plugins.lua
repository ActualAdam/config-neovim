local plugins = {}

local function declarePlugins(use)
    use({"wbthomason/packer.nvim"})

    use {
        "famiu/nvim-reload",
        requires = {
            "nvim-lua/plenary.nvim",
        }
    }

    use {
        "neovim/nvim-lspconfig",
        opt = true,
        event = "BufReadPre",
        wants = {
            "nvim-lsp-installer",
            "cmp-nvim-lsp",
            "nvim-cmp",
            "lsp_signature.nvim",
        },
        config = function()
            require("config.lsp").setup()
        end,
        requires = {
            "williamboman/nvim-lsp-installer",
            "ray-x/lsp_signature.nvim",
        },
    }

    use {
        "ray-x/lsp_signature.nvim",
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("config.treesitter").setup()
        end,
    }

    use {
        "folke/which-key.nvim",
        config = function()
            require("config.whichkey").setup()
        end,
    }

    use {
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({ default = true })
        end,
    }

    use {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        config = function()
            require("config.lualine").setup()
        end,
        requires = { "nvim-web-devicons" },
    }


    -- if I ever remove the homebrew installed fzf 
    -- use {
    --     'junegunn/fzf',
    --     run = './install --bin',
    -- }

    use {
     "ibhagwan/fzf-lua",
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "nvim-web-devicons",
        },
        cmd = { "NvimTreeToggle", "NvimTreeClose" },
        config = function()
            require("config.nvimtree").setup()
        end,
    }

    use {
        "windwp/nvim-autopairs",
        wants = {
            "nvim-treesitter",
        },
        module = {
            "nvim-autopairs.completion.cmp",
            "nvim-autopairs"
        },
        config = function()
            require("config.autopairs").setup()
        end,
    }

    use {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        opt = true,
        config = function()
            require("config.cmp").setup()
        end,
        wants = { "LuaSnip" },
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "ray-x/cmp-treesitter",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                config = function()
                    require("config.luasnip").setup()
                end,
            },
            "rafamadriz/friendly-snippets",
        },
        disable = false,
    }

    use {
        "Shatur/neovim-ayu",
        config = function()
            require("config.ayu").setup()
        end
    }
end

function plugins.setup()
    vim.cmd [[packadd packer.nvim]]
     -- still learning the language here, but I think this is passing the function literal, so packer provides whatever `use` is. 
     -- in many examples, I saw this function declared anonymously, but I think that syntax is so ugly, I'm avoiding it. 
    require("packer").startup(declarePlugins)
end

return plugins
