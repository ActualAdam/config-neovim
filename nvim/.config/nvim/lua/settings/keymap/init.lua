local keymap = {}

function keymap.setup()
  -- Keymaps for better default experience
  -- See `:help vim.keymap.set()`
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

  local navigation_opts = { silent = true }

  -- terminal mode bindings to match nvaigation plugin
  vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h', navigation_opts)
  vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j', navigation_opts)
  vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k', navigation_opts)
  vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l', navigation_opts)

  -- Remap for dealing with word wrap
  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
  -- See `:help telescope.builtin`
  vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
  vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer]' })

  vim.keymap.set('n', '<leader>sf', function()
    require('telescope.builtin').find_files({
      hidden = true,
      file_ignore_patterns = {
        ".git/",
        "target/"
      }
    })
  end, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)



  vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope file_browser<CR>", { noremap = true })
  vim.api.nvim_set_keymap("n", "<leader>fp", ":Telescope project<CR>", { noremap = true, silent = true })

  vim.keymap.set("n", "<leader>e", ":NvimTreeFindFile<CR>")

  vim.keymap.set("n", "<leader>tf", function()
    require("neotest").run.run(vim.fn.expand('%'))
  end, { desc = "[t][f] run test in the current buffer"})

  vim.keymap.set("n", "<leader>tn", function()
    require("neotest").run.run()
  end, { desc = "[t][n] run the nearest test"})

  vim.keymap.set("n", "<leader>to", function()
    require("neotest").output.open({ enter = true })
  end, { desc = "[t][o] open test report"})

  vim.api.nvim_set_keymap("n", "<leader>lc", ":LilyCmp<CR>", { noremap = true, desc = "[L]ilypond [C]ompile"})


end

return keymap
