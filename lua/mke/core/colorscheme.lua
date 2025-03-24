local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
	print("Colorscheme not found")
	return
end
-- if os.getenv("TMUX") then
-- 	local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
-- 	if not status then
-- 		print("Colorscheme not found")
-- 		return
-- 	end
-- else
-- 	-- local status, _ = pcall(vim.cmd, "colorscheme xcodedarkhc")
-- 	local status, _ = pcall(vim.cmd, "colorscheme naysayer")
-- 	if not status then
-- 		print("Colorscheme not found")
-- 		return
-- 	end
-- end
-- require("naysayer").setup({
-- 	variant = "main",
-- 	dark_variant = "main",
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = true,
-- 	disable_float_background = true,
-- 	disable_italics = true,
-- })

-- local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
-- if not status then
-- 	print("Colorscheme not found")
-- 	return
-- end
