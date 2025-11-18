-- Keymaps for LSP navigation and diagnostics

local opts = { noremap = true, silent = true }
local set = vim.keymap.set

set("n", "<c-]>", vim.lsp.buf.definition, opts)
set("n", "K", vim.lsp.buf.hover, opts)
set("n", "gD", vim.lsp.buf.implementation, opts)
set("n", "1gD", vim.lsp.buf.type_definition, opts)
set("n", "gr", vim.lsp.buf.references, opts)
set("n", "grn", vim.lsp.buf.rename, opts)
set("n", "g0", vim.lsp.buf.document_symbol, opts)
set("n", "gW", vim.lsp.buf.workspace_symbol, opts)
set("n", "gd", vim.lsp.buf.definition, opts)
set("n", "ga", vim.lsp.buf.code_action, opts)
set("n", "cf", "<cmd>ccl<CR>", opts)
set("n", "g[", vim.diagnostic.goto_prev, opts)
set("n", "g]", vim.diagnostic.goto_next, opts)

-- Show diagnostic popup on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = { "*.rs", "*.py" },
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})