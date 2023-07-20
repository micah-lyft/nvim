if os.getenv("TMUX") then
	local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
	if not status then
		print("Colorscheme not found")
		return
	end
else
	local status, _ = pcall(vim.cmd, "colorscheme darcula")
	if not status then
		print("Colorscheme not found")
		return
	end
end
