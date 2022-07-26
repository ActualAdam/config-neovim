local whichkey = {}

function whichkey.setup()
    local which_key = require("which-key")

    local conf = {
        window = {
            border = "single",
            position = "bottom",
        },
    }

    local opts = {
        mode = "n", -- Normal mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = false, -- use `nowait` when creating keymaps
    }

    local mappings = {
        ["w"] = { "<cmd>update!<CR>", "Save" },
        ["q"] = { "<cmd>q!<CR>", "Quit" },
        f = {
            name = "Find",
            f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
            b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
            o = { "<cmd>FzfLua oldfiles<cr>", "Old files" },
            g = { "<cmd>FzfLua live_grep<cr>", "Live grep" },
            c = { "<cmd>FzfLua commands<cr>", "Commands" },
            e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
        },
    }

    which_key.setup(conf)
    which_key.register(mappings, opts)
end

return whichkey
