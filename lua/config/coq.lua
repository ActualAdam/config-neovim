local coq = {}

function coq.setup()
    vim.g.coq_settings = {
        auto_start = true,
        clients = {
            tabnine = {
                enabled = true,
            }
        }
    }
    local coq = require("coq")
    coq.Now()
end

return coq
