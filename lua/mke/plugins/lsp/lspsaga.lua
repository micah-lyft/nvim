-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	-- Disable lightbulb to prevent "line out of range" errors
	lightbulb = {
		enable = false,
		sign = false,
		virtual_text = false,
	},
	-- keybinds for navigation in lspsaga window
	scroll_preview = {
		scroll_down = "<C-j>",
		scroll_up = "<C-k>",
	},
	-- use enter to open file with finder
	finder = {
		keys = {
			open = "<CR>",
		},
	},
	-- use enter to open file with definition preview
	definition = {
		keys = {
			edit = "<CR>",
		},
	},
})
