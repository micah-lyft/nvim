local setup, nvimtasks = pcall(require, "neovim-tasks")
if not setup then
	return
end

nvimtasks.setup()
