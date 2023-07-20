vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>a", ":split<CR>")
keymap.set("n", "<leader>v", ":vsplit<CR>")
keymap.set("n", "<leader>t", ":terminal<CR>") -- open new tab
keymap.set("n", "<leader>x", ":close<CR>")

keymap.set("n", "<leader>n", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>c", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>p", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>q", ":tabp<CR>") --  go to previous tab

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

keymap.set("n", "<leader>l", ":TagbarToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

vim.cmd([[noremap j gj]])
vim.cmd([[noremap k gk]])

keymap.set("n", "<C-b>", "<C-\\><C-n>")
keymap.set("i", "<C-b>", "<C-\\><C-n>")
