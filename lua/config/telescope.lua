local telescope_config = {}

function telescope_config.setup()
    require("telescope").setup()
    require("telescope").load_extension("fzf")
end


function telescope_config.find_files()
    local picker = require("telescope.builtin")
    local utils = require("utils")
    if utils.is_git() then
        picker.git_files()
    else
        picker.find_files()
    end
end

return telescope_config
