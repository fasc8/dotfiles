Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
Plug 'jose-elias-alvarez/null-ls.nvim'

" for better typescript support
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

function LoadLsp()
" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
---- Create lsp autocomplete capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
---- END



---- Rust-analyzer settings / setup
local rust_opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}
require('rust-tools').setup(rust_opts)
---- END

---- Pyright setup
lspconfig.pyright.setup{}
---- END

---- Javascript & Html setup
local null_ls = require("null-ls")
local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end
local on_attach = function(client, bufnr)
    --vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    --vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    --vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    --vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    --vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    --vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    --vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    --vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    --vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    --vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    --vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    --vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    --buf_map(bufnr, "n", "tgd", ":LspDef<CR>")
    --buf_map(bufnr, "n", "tgrn", ":LspRename<CR>")
    --buf_map(bufnr, "n", "t1gD", ":LspTypeDef<CR>")
    --buf_map(bufnr, "n", "tK", ":LspHover<CR>")
    --buf_map(bufnr, "n", "tg[", ":LspDiagPrev<CR>")
    --buf_map(bufnr, "n", "tg]", ":LspDiagNext<CR>")
    --buf_map(bufnr, "n", "tga", ":LspCodeAction<CR>")
    --buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    --buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end
lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        buf_map(bufnr, "n", "tgs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "tgi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "tgo", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
})
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
    },
    on_attach = on_attach,
})
---- END

---- Svelte
require'lspconfig'.svelte.setup{}
---- END

---- clangd (c, c++) support
require'lspconfig'.clangd.setup{
    capabilities = capabilities
}
---- END

EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'lspconfig' },
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF
endfunction

augroup LoadLsp
    autocmd!
    autocmd User PlugLoaded call LoadLsp()
augroup END

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> grn   <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> cf    <cmd>ccl<CR>
" Goto previous/next diagnostic warning/error
nnoremap <silent> g[    <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g]    <cmd>lua vim.diagnostic.goto_next()<CR>

" Show diagnostic popup on cursor hold
autocmd CursorHold *.rs,*.py lua vim.diagnostic.open_float(nil, { focusable = false })

autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
