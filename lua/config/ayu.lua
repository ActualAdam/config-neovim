local ayu = {}

function ayu.setup()
    require("ayu").setup({
        mirage = false,
        overrides = {},
    })
end

return ayu
