vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>s", ":split<CR>")
keymap.set("n", "<leader>v", ":vsplit<CR>")
keymap.set("n", "<leader>v", ":vsplit<CR>")
keymap.set("n", "<leader>x", ":close<CR>")


keymap.set("n", "<leader>t", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>c", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>p", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>q", ":tabp<CR>") --  go to previous tab
