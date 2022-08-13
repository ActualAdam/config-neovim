local plugins = {}



function plugins.declarePlugins(use)
    use({"wbthomason/packer.nvim"})

    use {
        "famiu/nvim-reload",
        requires = {
            "nvim-lua/plenary.nvim",
        }
    }

    use {
        "ms-jpq/coq_nvim",
        branch = "coq",
        run = ":COQdeps",
        config = function()
            require("config.coq").setup()
        end,
        requires = {
            {
                "ms-jpq/coq.artifacts",
                branch = "artifacts",
            },
            {
                "ms-jpq/coq.thirdparty",
                branch = "3p",
                module = "coq_3p"
            },
        },
    }

    use {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        wants = {
            "nvim-lsp-installer",
            "lsp_signature.nvim",
        },
        config = function()
            require("config.lsp").setup()
        end,
        requires = {
            "williamboman/nvim-lsp-installer",
            "ray-x/lsp_signature.nvim",
        },
        after = {
            "coq_nvim"
        }
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
        requires = {
            {
                "windwp/nvim-ts-autotag",
                config = function()
                    require("nvim-ts-autotag").setup {
                        enable = true
                    }
                end,
            }
        }
    }

    use {
        "RRethy/nvim-treesitter-endwise",
        after = "nvim-treesitter",
        config = function()
            require('nvim-treesitter.configs').setup {
                endwise = {
                    enable = true,
                },
            }
        end
    }

    use {
        "windwp/nvim-autopairs",
        run = "make",
        after = "nvim-treesitter",
        config = function()
            require("config.autopairs").setup()
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
        "mfussenegger/nvim-dap",
    }

    use {
        "sindrets/diffview.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-web-devicons",
        },
    }

    use {
        "Shatur/neovim-ayu",
        config = function()
            require("config.ayu").setup()
        end
    }

    use {
        "metakirby5/codi.vim",
        config = function()
            vim.g["codi#virtual_test_prefix"] = "> "
        end,
    }

    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "vim-test/vim-test",
        },
        configure = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-vim-test")
                }
            })
        end
    }

end

return plugins
