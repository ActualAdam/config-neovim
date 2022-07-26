local keymap = {}

local function mapKeys(mode, fromKey, toCmd, additionalOptions)
    local options = { noremap = true }
    if additionalOptions then
        options = vim.tbl_extend("force", options, additionalOptions)
    end
    vim.api.nvim_set_keymap(mode, fromKey, toCmd, options)
end

function keymap.setup()
    -- Use alt + hjkl to resize windows
    mapKeys("n", "<M-j>", ":resize -2<CR>")
    mapKeys("n", "<M-k>", ":resize +2<CR>")
    mapKeys("n", "<M-h>", ":vertical resize -2<CR>")
    mapKeys("n", "<M-l>", ":vertical resize +2<CR>")


    -- Don"t reset visual mode selection after indent
    mapKeys("v", "<", "<gv")
    mapKeys("v", ">", ">gv")
end 

return keymap
