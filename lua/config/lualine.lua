local lualine = {}

function lualine.setup()
    require("lualine").setup {
        options = {
            theme = "ayu",
        },
    }
end

return lualine
