local general = {}

function general.setup()
	-- [[ Setting options ]]
	-- See `:help vim.o`

	-- Set highlight on search
	vim.o.hlsearch = false

	-- Make line numbers default
	vim.wo.number = true

	-- Enable mouse mode
	vim.o.mouse = 'a'

	-- Enable break indent
	vim.o.breakindent = true

	-- Save undo history
	vim.o.undofile = true

	-- Case insensitive searching UNLESS /C or capital in search
	vim.o.ignorecase = true
	vim.o.smartcase = true

	-- Decrease update time
	vim.o.updatetime = 250
	vim.wo.signcolumn = 'yes'

	vim.o.expandtab = true
	vim.o.ts = 4
	vim.o.sw = 4
	vim.o.softtabstop = 4

	-- [[ Highlight on yank ]]
	-- See `:help vim.highlight.on_yank()`
	local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
	vim.api.nvim_create_autocmd('TextYankPost', {
	  callback = function()
	    vim.highlight.on_yank()
	  end,
	  group = highlight_group,
	  pattern = '*',
	})

	-- Set colorscheme
	vim.o.termguicolors = true
	vim.cmd('colorscheme onedark')

	-- Set completeopt to have a better completion experience
	vim.o.completeopt = 'menuone,noselect'

	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup("adamGroup", {clear = true}),
		pattern = "*.lua",
		callback = function()
			require("neotest").run.run()
		end,
	})

end

return general
