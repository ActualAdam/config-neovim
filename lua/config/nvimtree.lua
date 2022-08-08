local nvimtree = {}

function nvimtree.setup()
    require("nvim-tree").setup {
        disable_netrw = true,
        hijack_netrw = true,
        view = {
            adaptive_size = true,
            side = "left",
            number = true,
            relativenumber = true,
            mappings = {
                list = {
                    { key = "u", action = "dir_up" },
                    { key = "l", action = "open_file" },
                    { key = "h", action = "open_file" },
                    { key = "L", action = "expand_all" },
                    { key = "H", action = "collaps_all" },
                },
            },
        },
        actions = {
            open_file = {
                resize_window = false,
            },
        },
        filters = {
            custom = { ".git" },
        },
--        on_attach = function(bufnr)
--            local api = require("nvim-tree.api")
        --  this seems cool, but it sets the keymap for all of nvim 
        --  I need this just for the nvim-tree window. not sure how to do that yet.
        --  but super awesome I can just make function and value calls 
--             vim.keymap.set("n", "l", api.node.open.edit)
--             vim.keymap.set("n", "h", api.node.open.edit)
--            vim.keymap.set("n", "L", api.tree.expand_all)
--            vim.keymap.set("n", "H", api.tree.collaps_all)
--             local inject_node = require("nvim-tree.utils").inject_node
-- 
--             vim.keymap.set("n", "<leader>n", inject_node(function(node)
--                 if node then
--                     print(node.absolute_path)
--                 end
--             end), { buffer = bufnr, noremap = true })
-- 
--             vim.bo[bufnr].path = "/tmp"
--        end
--
    }
end

return nvimtree
