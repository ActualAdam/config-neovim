local finder = {}

function finder.find_files()
  local fzf = require("fzf-lua")
  if vim.fn.system "git rev-parse --is-inside-work-tree" == true then
    fzf.git_files()
  else
    fzf.files()
  end
end

return finder
