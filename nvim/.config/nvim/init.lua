local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- disable netrw. we'll use telescope and nvim tree
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require("lazy").setup("plugins")
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")

require("settings.general").setup()
require("settings.keymap").setup()


-- Turn on lsp status information
require('fidget').setup({
  notification = {
    window = {
      winblend = 0, -- background window opacity
    },
  }
})

require('config.dap').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = {
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'cmp_tabnine' },
    {
      name = 'treesitter',
      max_item_count = 5,
    },

    { name = 'luasnip' },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end
      }
    },
  },
}

cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    {
      { name = 'nvim_lsp_document_symbol'}
    }, {
      { name = 'buffer' }
    }
  })
})

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- snip
local ls = require('luasnip')
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

vim.api.nvim_cmd({
  cmd = 'colorscheme',
  args = {'catppuccin'}
}, {})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.lilypond = {
  install_info = {
    url = "https://github.com/tristanperalta/tree-sitter-lilypond", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = true, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "ly", -- if filetype does not match the parser name
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
