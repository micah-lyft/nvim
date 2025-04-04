local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim with this file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-lua.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("preservim/tagbar")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- use("gruvbox-community/gruvbox")
	-- use("morhetz/gruvbox")
	use("micahke/gruvbox.nvim")
	use("doums/darcula")
	use("christoomey/vim-tmux-navigator")

	use("szw/vim-maximizer")

	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	-- to make comments easier
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	use("ranjithshegde/ccls.nvim")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- github copilot
	use("github/copilot.vim")

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	-- use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	})
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	use("simrat39/rust-tools.nvim")

	-- use("Shatur/neovim-tasks")

	use("lunacookies/vim-colors-xcode")

	-- use("romgrk/barbar.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		-- commit = "cc360a9beb1b30d172438f640e2c3450358c4086",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- use({
	-- 	"jackMort/ChatGPT.nvim",
	-- 	config = function()
	-- 		require("chatgpt").setup()
	-- 	end,
	-- 	requires = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- })
	use("LunarVim/lunar.nvim")
	use({ "projekt0n/github-nvim-theme" })
	use({ "alljokecake/naysayer-theme.nvim", as = "naysayer" })
	-- use({
	-- 	"epwalsh/obsidian.nvim",
	-- 	tag = "*", -- recommended, use latest release instead of latest commit
	-- 	requires = {
	-- 		-- Required.
	-- 		"nvim-lua/plenary.nvim",
	--
	-- 		-- see below for full list of optional dependencies 👇
	-- 	},
	-- 	config = function() end,
	-- })

	use("lervag/vimtex")
	-- use({
	-- 	"notjedi/nvim-rooter.lua",
	-- 	config = function()
	-- 		require("nvim-rooter").setup()
	-- 	end,
	-- })
	use({
		"olimorris/codecompanion.nvim",
		config = function()
			require("codecompanion").setup()
		end,
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
			"nvim-telescope/telescope.nvim", -- Optional: For using slash commands
			"stevearc/dressing.nvim", -- Optional: Improves `vim.ui.select`
		},
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
