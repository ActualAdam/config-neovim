-- indentation settings
vim.opt.sw = 4                    -- indentation 4 spaces
vim.opt.ts = 4                    -- tab displays as 4 spaces
vim.opt.expandtab = true              -- tab key is the same as space x 4 
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.showtabline = 4


-- line numbering
-- when set in this order, lines will show the current absolute line number
-- and all other lines will show the relative distance from current
vim.opt.nu = true                      -- show line numbers
vim.opt.rnu = true                     -- relative line numbers from current line

vim.opt.wrap = false                 -- no line wrapping 
vim.opt.fileencoding = "utf-8"        -- encoding on write
vim.opt.ruler = true                   -- cursor position

vim.opt.hidden = true                  -- lets you switch buffers without saving

vim.opt.cmdheight = 1
vim.opt.pumheight = 10            -- popup menu height (smaller than default)
vim.opt.laststatus = 2            -- always show the status line
vim.opt.showmode = false
vim.opt.ignorecase = true


vim.opt.backup = false                -- backups don't spark joy
vim.opt.writebackup = false

vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

vim.opt.clipboard = "unnamedplus"

vim.opt.mouse = "a"

-- when splitting where to splits get placed
-- set splitbelow
-- set splitright

vim.opt.cursorline = true

vim.opt.conceallevel = 0     -- show raw text instead of concealing markup


vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- trim whitespace before eol on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

 -- syntax enable
vim.cmd [[
  au! BufWritePost $MYVIMRC source % 
]]

