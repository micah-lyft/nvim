local setup, copilot = pcall(require, "Copilot")
if not setup then
	return
end

copilot.setup()
