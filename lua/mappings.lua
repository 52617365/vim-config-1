-------------
-- Mappings --
--------------
local opts = { noremap = true, silent = true }
local non_silent_opts = { noremap = true, silent = false }

-- resize buffers
-- TODO: Add resizing keybindings.
-- vim.keymap.set('n', '<C-h>', ':vertical resize -10<cr>', opts)
-- vim.keymap.set('n', '<C-j>', ':resize -10<cr>', opts)
-- vim.keymap.set('n', '<C-k>', ':resize 10<cr>', opts)
-- vim.keymap.set('n', '<C-l>', ':vertical resize 10<cr>', opts)

-- Saving stuff to save time
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', opts)
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>', opts)

-- Remaps for vim-fugitive
vim.keymap.set('n', '<Leader>gs', ':G<CR>', opts)
vim.keymap.set('n', '<Leader>gc', ':Gwrite<CR>', opts)
vim.keymap.set('n', '<Leader>gp', ':Git -c push.default=current push<CR>', opts)
vim.keymap.set('n', '<Leader>gj', ':diffget //3<CR>', opts)
vim.keymap.set('n', '<Leader>gf', ':diffget //2<CR>', opts)
-- reload configuration file with :wc
vim.keymap.set('n', '<Leader>wc', ':source $HOME/.config/nvim/init.lua<CR>', opts)

-- Show harpoon files with leader leader
vim.keymap.set('n', '<Leader><Leader>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
vim.keymap.set('n', '<Leader>a', ':lua require("harpoon.mark").add_file()<CR>', opts)
vim.keymap.set('n', '<Leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
vim.keymap.set('n', '<Leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
vim.keymap.set('n', '<Leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
vim.keymap.set('n', '<Leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)

vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<cr>', opts)
vim.keymap.set('n', '<Leader>gg', ':Telescope live_grep<cr>', opts)
vim.keymap.set('n', '<Leader>bb', ':Telescope buffers<cr>', opts)
vim.keymap.set('n', '<Leader>tt', ':Telescope help_tags<cr>', opts)
vim.keymap.set('n', '<Leader>pp', ':Telescope projects<cr>', opts)
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<cr>", { noremap = true })

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap("v", "<leader>rr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", { noremap = true })

-- lspconfig keybindings
vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.keymap.set('n', 'se', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Google searches
--vim.keymap.set('n', '<Leader>s', '<Plug>SearchNormal', opts)
vim.keymap.set('n', '<Leader>s', ':BrowserSearch ', non_silent_opts)
--vim.keymap.set('v', '<Leader>s', '<Plug>SearchVisual',  opts)
vim.keymap.set('v', '<Leader>s', ':BrowserSearch<CR>', opts)

-- Trouble.nvim keybindings (Diagnostics)
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<CR>", opts)
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", opts)
vim.keymap.set("n", "<leader>xe", "<cmd>Trouble lsp_references<CR>", opts)

-- Toggle nerd tree
-- ( (t)oggle (t)ree)
vim.keymap.set("n", "tt", "<cmd>lua require 'nvim-tree'.toggle(true)<CR>", opts)

-- Telescope project keybinding
vim.keymap.set('n', '<leader>fp', ":lua require'telescope'.extensions.project.project{}<CR>", opts)

-- Telescope file browser
-- Hop.nvim
vim.keymap.set('n', '<leader>h', ":HopWord<CR>", opts)
vim.keymap.set('n', '<leader>c', ":HopChar1<CR>", opts)

-- debug (dap)
-- vim.keymap.set('n', '<leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", opts)
-- vim.keymap.set('n', '<leader>c', ":lua require'dap'.continue()<CR>", opts)
-- vim.keymap.set('n', '<leader>o', ":lua require'dap'.step_over()<CR>", opts)
-- vim.keymap.set('n', '<leader>i', ":lua require'dap'.step_into()<CR>", opts)
-- vim.keymap.set('n', '<leader>r', ":lua require'dap'.repl.open()<CR>", opts)
