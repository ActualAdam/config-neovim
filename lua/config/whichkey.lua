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
            f = { "<cmd>lua require('config.telescope').find_files()<cr>", "Files" },
            b = { "<cmd>Telescope buffers<cr>", "Buffers" },
            o = { "<cmd>Telescope oldfiles<cr>", "Old files" },
            g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
            c = { "<cmd>Telescope commands<cr>", "Commands" },
            p = { "<cmd>Telescope project<cr>", "Projects" },
        },
        t = {
            name = "Tree",
            t = { "<cmd>NvimTreeToggle<cr>", "Tree Toggle" },
            f = { "<cmd>NvimTreeFindFile<cr>", "Find Current File" },
            F = { "<cmd>NvimTreeFindFileToggle<cr>", "Follow Current File" },
        },
        p = {
            name = "Plugin",
            s = { "<cmd>PackerStatus<cr>", "Status" },
            i = { "<cmd>PackerInstall<cr>", "Install" },
            x = { "<cmd>PackerSync<cr>", "Sync" },
            u = { "<cmd>PackerUpdate<cr>", "Update" },
        }
    }

    which_key.setup(conf)
    which_key.register(mappings, opts)
end

return whichkey
