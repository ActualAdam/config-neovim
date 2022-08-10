local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
end

require("packer").startup(function(use)
    require("plugins").declarePlugins(use)
    if packer_bootstrap then
        require("packer").sync()
    end
end)

require("keymap").setup()

require("ayu").colorscheme()

