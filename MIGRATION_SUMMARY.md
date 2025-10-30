# Neovim LSP Configuration Migration Summary

## Date: 2025-10-30

This document summarizes the migration from the deprecated `require('lspconfig')` API to the new `vim.lsp.config()` API for Neovim 0.11+.

## Key Changes

### 1. lspconfig.lua - Core LSP Configuration

**Before:**
```lua
local lspconfig = require("lspconfig")
lspconfig["servername"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
```

**After:**
```lua
vim.lsp.config("servername", {
    capabilities = capabilities,
    on_attach = on_attach,
})
vim.lsp.enable("servername")
```

### 2. Root Directory Pattern Changes

**Before:**
```lua
root_dir = lspconfig.util.root_pattern(".git")
root_dir = function(fname)
    return lspconfig.util.root_pattern("init.lua", ".git")(fname) 
           or lspconfig.util.path.dirname(fname)
end
```

**After:**
```lua
root_dir = vim.fs.root(0, { ".git" })
root_dir = vim.fs.root(0, { "init.lua", ".git" })
```

### 3. Migrated Language Servers

All servers have been migrated to the new API:
- ✅ html
- ✅ rust_analyzer  
- ✅ jdtls
- ✅ ts_ls (TypeScript)
- ✅ cssls
- ✅ gopls
- ✅ pyright
- ✅ bufls
- ✅ clangd
- ✅ lua_ls

### 4. mason-lspconfig.nvim Updates

**Before:**
```lua
mason_lspconfig.setup({
    automatic_installation = true,
})
```

**After:**
```lua
mason_lspconfig.setup({
    automatic_enable = true, -- Replaces automatic_installation in v2.0.0
})
```

## Benefits

1. **No more deprecation warnings** - Uses the official Neovim 0.11+ API
2. **Future-proof** - Compatible with upcoming nvim-lspconfig v3.0.0
3. **Cleaner integration** - vim.lsp.config automatically finds configs from nvim-lspconfig
4. **Better root detection** - vim.fs.root is more reliable than lspconfig.util.root_pattern

## Backup

A backup of the original configuration was created at:
- `/Users/micahelias/.config/nvim/lua/mke/plugins/lsp/lspconfig.lua.backup`

## Next Steps

1. Run `:PackerSync` in Neovim to update plugins
2. Restart Neovim
3. Verify all LSP servers are working correctly
4. If any issues occur, you can restore from the backup file

## Additional Notes

- The `require('lspconfig')` import has been completely removed
- Only commented-out code contains old lspconfig references
- All active server configurations use the new API
