-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local keymap = vim.keymap -- for conciseness

local on_attach = function(client, bufnr)
	client.server_capabilities.semanticTokensProvider = nil
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
	keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts) -- got to declaration

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
})

lspconfig.jdtls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["jdtls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["csharp_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.texlab.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	-- settings = {
	-- 	texlab = {
	-- 		auxDirectory = ".",
	-- 		bibtexFormatter = "texlab",
	-- 		build = {
	-- 			args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
	-- 			executable = "latexmk",
	-- 			forwardSearchAfter = false,
	-- 			onSave = true,
	-- 		},
	-- 		chktex = {
	-- 			onEdit = false,
	-- 			onOpenAndSave = false,
	-- 		},
	-- 		diagnosticsDelay = 300,
	-- 		formatterLineLength = 80,
	-- 		forwardSearch = {
	-- 			args = {},
	-- 		},
	-- 		latexFormatter = "latexindent",
	-- 		latexindent = {
	-- 			modifyLineBreaks = true,
	-- 		},
	-- 	},
	-- },
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- lspconfig["pyright"].setup({
-- 	on_attach = on_attach,
-- 	settings = {
-- 		pyright = { autoImportCompletion = true },
-- 		python = {
-- 			analysis = {
-- 				autoSearchPaths = true,
-- 				diagnosticMode = "openFilesOnly",
-- 				useLibraryCodeForTypes = true,
-- 				typeCheckingMode = "off",
-- 			},
-- 		},
-- 	},
-- })

lspconfig["bufls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- lspconfig["pylsp"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- lspconfig["ccls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

lspconfig["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern(".git"),
})

-- configure emmet language server
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
	-- on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"svelte",
		"pug",
		"typescriptreact",
		"vue",
	},
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

-- configure lua server (with special settings)
lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
	root_dir = function(fname)
		return lspconfig.util.root_pattern("init.lua", ".git")(fname) or lspconfig.util.path.dirname(fname)
	end,
})

-- require("nvim-rooter").setup({
-- 	rooter_patterns = { ".git", ".hg", ".svn" },
-- 	trigger_patterns = { "*" },
-- 	manual = false,
-- 	fallback_to_parent = false,
-- })

vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = true }]])
