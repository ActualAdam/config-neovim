local autopairs = {}

function autopairs.setup()
    local nvim_autopairs = require("nvim-autopairs")
    nvim_autopairs.setup {
        check_ts = true,
    }
end

return autopairs
