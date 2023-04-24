local setup, copilot = pcall(require, "copilot")
if not setup then
	return
end

copilot.setup()

vim.cmd([[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]])
vim.cmd([[let g:copilot_no_tab_map = v:true]])
