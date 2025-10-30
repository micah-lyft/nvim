-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"ts_ls",
		"html",
		"cssls",
		"lua_ls",
		"emmet_ls",
	},
	-- NOTE: automatic_installation removed in v2.0.0 with new vim.lsp.config API
	-- Use automatic_enable instead (enabled by default)
	-- automatic_enable will call vim.lsp.enable() for installed servers
	automatic_enable = true,
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		-- NOTE: eslint_d removed from none-ls core, commented out
		-- "eslint_d", -- ts/js linter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
