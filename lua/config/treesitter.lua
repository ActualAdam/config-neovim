local treesitter = {}

function treesitter.setup() 
    require("nvim-treesitter.configs").setup {
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
    }
end

return treesitter
