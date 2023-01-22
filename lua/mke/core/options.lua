local set = vim.opt

--set.number = true
--set.autoindent = true
--set.tabstop = 2
--set.shiftwidth = 2
--set.relativenumber = true
--set.wrap = false
--set.smarttab = true
--set.softtabstop= 2
--set.autoread = true
--set.splitright = true
--set.splitbelow = true

-- line numbers
set.relativenumber = true
set.number = true

-- tabs and indentation
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true

-- line wrapping
set.wrap = true

-- search settings
set.ignorecase = true
set.smartcase = true

-- cursor line
set.cursorline = true

-- appearance
set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"

-- backspace
set.backspace = "indent,eol,start"

-- clipboard
set.clipboard:append("unnamedplus")

-- split windows
set.splitright = true
set.splitbelow = true

set.iskeyword:append("-")

vim.cmd([[set mouse=a]])
