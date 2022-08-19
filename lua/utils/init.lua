_G.dump = function(...)
  print(vim.inspect(...))
end

_G.prequire = function(...)
  local status, lib = pcall(require, ...)
  if status then
    return lib
  end
  return nil
end

local utils = {}

function utils.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

--
-- true if we are in a git repo. otherwise false
--
function utils.is_git()
    return vim.fn.system "git rev-parse --is-inside-work-tree"
end

function utils.log(msg, hl, name)
  name = name or "Neovim"
  hl = hl or "Todo"
  vim.api.nvim_echo({ { name .. ": ", hl }, { msg } }, true, {})
end

function utils.warn(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name })
end

function utils.error(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

function utils.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name })
end

return utils
