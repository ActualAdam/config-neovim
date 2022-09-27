local telescope_config = {}

function telescope_config.setup()
    local telescope = require("telescope")
    telescope.setup({
        defaults = {
            file_ignore_patterns = {
                "^.git/.*$"
            },
        },
        extensions = {
            project = {
                hidden_files = true,
            },
        },
        pickers = {
            live_grep = {
                additional_args = function(opts)
                    local args = {
                        "--hidden"
                    }
                    return args
                end,
            },
        },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension("project")
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
