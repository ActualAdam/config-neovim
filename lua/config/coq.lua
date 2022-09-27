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
end

return coq
