local setup, ccls = pcall(require, "ccls.nvim")
if not setup then
	return
end

ccls.setup()
