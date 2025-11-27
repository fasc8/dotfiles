-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-------------------------------------------------------------------------------
--
-- preferences
--
-------------------------------------------------------------------------------
-- never ever folding
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99

-- keep more context on screen while scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
--
-- never show me line breaks if they're not there
vim.opt.wrap = false

-- always draw sign column. prevents buffer moving when adding/deleting sign
vim.opt.signcolumn = "yes:2"

-- relative numbers except for current line
vim.opt.relativenumber = true
vim.opt.number = true

-- keep current content top and left when splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- infinite undo!
-- NOTE: ends up in ~/.local/state/nvim/undo/
vim.opt.undofile = true

--" Decent wildmenu
-- in completion, when there is more than one match,
-- list all matches, and only complete to longest common match
-- vim.opt.wildmode = { "longest:full", "full" }
vim.opt.wildmode = 'list:longest'
-- when opening a file with a command (like :e),
-- don't suggest files like there:
vim.opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'
-- tabs: go big or go home
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- case-insensitive search/replace
vim.opt.ignorecase = true
-- unless uppercase in search term
vim.opt.smartcase = true
-- never ever make my terminal beep
vim.opt.vb = true

-- more useful diffs (nvim -d)
--- by ignoring whitespace
vim.opt.diffopt:append('iwhite')
--- and using a smarter algorithm
--- https://vimways.org/2018/the-power-of-diff/
--- https://stackoverflow.com/questions/32365271/whats-the-difference-between-git-diff-patience-and-git-diff-histogram
--- https://luppeng.wordpress.com/2020/10/10/when-to-use-each-of-the-git-diff-algorithms/
vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')
-- show a column at 80 characters as a guide for long lines
vim.opt.colorcolumn = '80'
--- except in Rust where the rule is 100 characters
vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })
-- show more hidden characters
-- also, show tabs nicer
vim.opt.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'

vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.spell = true
vim.opt.title = true
vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.joinspaces = false
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.exrc = true
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.local/share/nvim/backup/")
vim.opt.updatetime = 300
vim.opt.redrawtime = 10000
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.shortmess:append("c")
vim.opt.cmdheight = 2
vim.opt.incsearch = true
vim.opt.gdefault = true
vim.opt.encoding = "utf-8"
vim.opt.foldmethod = "manual"

-------------------------------------------------------------------------------
--
-- hotkeys
--
-------------------------------------------------------------------------------
-- quick-save
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')

-- Ctrl+j and Ctrl+k as Esc
vim.keymap.set('n', '<C-j>', '<Esc>')
vim.keymap.set('i', '<C-j>', '<Esc>')
vim.keymap.set('v', '<C-j>', '<Esc>')
vim.keymap.set('s', '<C-j>', '<Esc>')
vim.keymap.set('x', '<C-j>', '<Esc>')
vim.keymap.set('c', '<C-j>', '<Esc>')
vim.keymap.set('o', '<C-j>', '<Esc>')
vim.keymap.set('l', '<C-j>', '<Esc>')
vim.keymap.set('t', '<C-j>', '<Esc>')
-- Ctrl-j is a little awkward unfortunately:
-- https://github.com/neovim/neovim/issues/5916
-- So we also map Ctrl+k
vim.keymap.set('n', '<C-k>', '<Esc>')
vim.keymap.set('i', '<C-k>', '<Esc>')
vim.keymap.set('v', '<C-k>', '<Esc>')
vim.keymap.set('s', '<C-k>', '<Esc>')
vim.keymap.set('x', '<C-k>', '<Esc>')
vim.keymap.set('c', '<C-k>', '<Esc>')
vim.keymap.set('o', '<C-k>', '<Esc>')
vim.keymap.set('l', '<C-k>', '<Esc>')
vim.keymap.set('t', '<C-k>', '<Esc>')
-- Ctrl+h to stop searching
vim.keymap.set('v', '<C-h>', '<cmd>nohlsearch<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>nohlsearch<cr>')
-- Jump to start and end of line using the home row keys
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')
-- <leader><leader> toggles between buffers
vim.keymap.set('n', '<leader><leader>', '<c-^>')
-- <leader>, shows/hides hidden characters
vim.keymap.set('n', '<leader>,', ':set invlist<cr>')
-- always center search results
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { silent = true })
-- "very magic" (less escaping needed) regexes by default
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('c', '%s/', '%sm/')
-- open new file adjacent to current file
vim.keymap.set('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <cr>')
-- no arrow keys --- force yourself to use the home row
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')
vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
-- let the left and right arrows be useful: they can switch buffers
vim.keymap.set('n', '<left>', ':bp<cr>')
vim.keymap.set('n', '<right>', ':bn<cr>')
-- make j and k move by visual line, not actual line, when text is soft-wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
-- keep moved selection highlighted
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
-- ?
vim.keymap.set("v", "y", "myy`y", { noremap = true, silent = true })
vim.keymap.set("v", "Y", "myY`y", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>h", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>y", ":History:<CR>", { noremap = true, silent = true })

-------------------------------------------------------------------------------
--
-- configuring diagnostics
--
-------------------------------------------------------------------------------
-- Allow virtual text
vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

-------------------------------------------------------------------------------
--
-- autocommands
--
-------------------------------------------------------------------------------
-- highlight yanked text
vim.api.nvim_create_autocmd(
    'TextYankPost',
    {
      pattern = '*',
      command = 'silent! lua vim.highlight.on_yank({ timeout = 500 })'
    }
)
-- jump to last edit position on opening file
vim.api.nvim_create_autocmd(
    'BufReadPost',
    {
      pattern = '*',
      callback = function(ev)
         if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            -- except for in git commit messages
            -- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
            if not vim.fn.expand('%:p'):find('.git', 1, true) then
               vim.cmd('exe "normal! g\'\\""')
            end
         end
      end
    }
)
-- leave paste mode when leaving insert mode (if it was on)
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', command = 'set nopaste' })

-- Custom commands

vim.api.nvim_create_user_command("FixWhitespace", ":%s/\\s\\+$//e", {})
vim.api.nvim_create_user_command("MarkdownTableFix", "! tr -s ' ' | column -t -s '|' -o '|'", { range = true })


-------------------------------------------------------------------------------
--
-- plugin configuration
--
-------------------------------------------------------------------------------
-- first, grab the manager
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Functions for neo-tree
local function on_move(args)
    -- Define what should happen on file move/rename events
    -- For example, refresh neo-tree or update UI
    -- This is a placeholder; adjust as needed:
    require("neo-tree.sources.filesystem").refresh()
end

local function get_root_dir()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients > 0 then
        local root = clients[1].config.root_dir
        if root then
            return root
        end
    end
    -- fallback to git root
    local git_dir = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if git_dir ~= nil and git_dir ~= '' and vim.v.shell_error == 0 then
        return git_dir
    end
    -- fallback to cwd
    return vim.fn.getcwd()
end

-- load plugins in plugins dir
require("lazy").setup({
   -- nice bar at the bottom
    {
        'itchyny/lightline.vim',
        lazy = false, -- also load at start since it's UI
        config = function()
            -- no need to also show mode in cmd line when we have bar
            vim.o.showmode = false
            vim.g.lightline = {
                active = {
                    left = {
                        { 'mode', 'paste' },
                        { 'readonly', 'filename', 'modified' }
                    },
                    right = {
                        { 'lineinfo' },
                        { 'percent' },
                        { 'fileencoding', 'filetype' }
                    },
                },
                component_function = {
                    filename = 'LightlineFilename'
                },
            }
            function LightlineFilenameInLua(opts)
                if vim.fn.expand('%:t') == '' then
                    return '[No Name]'
                else
                    return vim.fn.getreg('%')
                end
            end
            -- https://github.com/itchyny/lightline.vim/issues/657
            vim.api.nvim_exec(
                [[
                function! g:LightlineFilename()
                    return v:lua.LightlineFilenameInLua()
                endfunction
                ]],
                true
            )
        end
    },
    -- quick navigation
    {
        'ggandor/leap.nvim',
        config = function()
            vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
            vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
        end
    },
    -- better %
    {
        'andymass/vim-matchup',
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    },
    -- auto-cd to root of git project
    {
        'notjedi/nvim-rooter.lua',
        config = function()
            require('nvim-rooter').setup()
        end
    },
    -- fzf support for ^p
    {
        'ibhagwan/fzf-lua',
        config = function()
            -- stop putting a giant window over my editor
            require'fzf-lua'.setup{
                winopts = {
                    split = "belowright 10new",
                    preview = {
                        hidden = true,
                    }
                },
                files = {
                    -- file icons are distracting
                    file_icons = false,
                    -- git icons are nice
                    git_icons = true,
                    -- but don't mess up my anchored search
                    _fzf_nth_devicons = true,
                },
                buffers = {
                    file_icons = false,
                    git_icons = true,
                    -- no nth_devicons as we'll do that
                    -- manually since we also use
                    -- with-nth
                },
                fzf_opts = {
                    -- no reverse view
                    ["--layout"] = "default",
                },
            }
            -- when using C-p for quick file open, pass the file list through
            --
            --   https://github.com/jonhoo/proximity-sort
            --
            -- to prefer files closer to the current file.
            vim.keymap.set('', '<C-p>', function()
                opts = {}
                opts.cmd = 'fd --color=never --hidden --type f --type l --exclude .git'
                local base = vim.fn.fnamemodify(vim.fn.expand('%'), ':h:.:S')
                if base ~= '.' then
                    -- if there is no current file,
                    -- proximity-sort can't do its thing
                    opts.cmd = opts.cmd .. (" | proximity-sort %s"):format(vim.fn.shellescape(vim.fn.expand('%')))
                end
                opts.fzf_opts = {
                  ['--scheme']    = 'path',
                  ['--tiebreak']  = 'index',
                  ["--layout"]    = "default",
                }
                require'fzf-lua'.files(opts)
            end)
            -- use fzf to search buffers as well
            vim.keymap.set('n', '<leader>;', function()
                require'fzf-lua'.buffers({
                    -- just include the paths in the fzf bits, and nothing else
                    -- https://github.com/ibhagwan/fzf-lua/issues/2230#issuecomment-3164258823
                    fzf_opts = {
                      ["--with-nth"]      = "{-3..-2}",
                      ["--nth"]           = "-1",
                      ["--delimiter"]     = "[:\u{2002}]",
                      ["--header-lines"]  = "false",
                    },
                    header = false,
                })
            end)
        end
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        config = function()
            -- Setup language servers.

            -- Rust
            vim.lsp.config('rust_analyzer', {
                -- Server-specific settings. See `:help lspconfig-setup`
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            features = "all",
                        },
                        checkOnSave = {
                            enable = true,
                        },
                        check = {
                            command = "clippy",
                        },
                        imports = {
                            group = {
                                enable = false,
                            },
                        },
                        completion = {
                            postfix = {
                                enable = false,
                            },
                        },
                    },
                },
            })
            vim.lsp.enable('rust_analyzer')

            -- Bash LSP
            if vim.fn.executable('bash-language-server') == 1 then
                vim.lsp.enable('bashls')
            end

            -- Ruff for Python
            if vim.fn.executable('ruff') == 1 then
                vim.lsp.enable('ruff')
            end

            -- pyright for python
            if vim.fn.executable('pyright') == 1 then
                vim.lsp.config('pyright', {
                    settings = {
                        pyright = {
                            -- Using Ruff's importer organizer
                            disableOrganizeImports = true,
                        },
                        python = {
                            analysis = {
                                -- ignoer all files for analysis to exclusively use Ruff
                                ignore = { '*' }
                            },
                        },
                    },
                })
                vim.lsp.enable('pyright')
            end

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<leader>el', vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set('n', '<leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    --vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                    vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
                    vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)

                    local client = vim.lsp.get_client_by_id(ev.data.client_id)

                    -- TODO: find some way to make this only apply to the current line.
                    if client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
                    end

                    -- None of this semantics tokens business.
                    -- https://www.reddit.com/r/neovim/comments/143efmd/is_it_possible_to_disable_treesitter_completely/
                    client.server_capabilities.semanticTokensProvider = nil

                    -- format on save for Rust
                    if client.server_capabilities.documentFormattingProvider then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = vim.api.nvim_create_augroup("RustFormat", { clear = true }),
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            })
        end
    },
    -- LSP-based code-completion
    {
        "hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            'neovim/nvim-lspconfig',
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require'cmp'
            cmp.setup({
                snippet = {
                    -- REQUIRED by nvim-cmp. get rid of it once we can
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    -- Accept currently selected item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                }, {
                    { name = 'path' },
                }),
                experimental = {
                    ghost_text = true,
                },
            })

            -- Enable completing paths in :
            cmp.setup.cmdline(':', {
                sources = cmp.config.sources({
                    { name = 'path' }
                })
            })
        end
    },
    -- inline function signatures
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            -- Get signatures (and _only_ signatures) when in argument lists.
            require "lsp_signature".setup({
                doc_lines = 0,
                handler_opts = {
                    border = "none"
                },
            })
        end
    },
    -- language support
    -- toml
    'cespare/vim-toml',
    -- yaml
    {
        "cuducos/yaml.nvim",
        ft = { "yaml" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    -- fish
    'khaveesh/vim-fish-syntax',
    -- markdown
    {
        'plasticboy/vim-markdown',
        ft = { "markdown" },
        dependencies = {
            'godlygeek/tabular',
        },
        config = function()
            -- never ever fold!
            vim.g.vim_markdown_folding_disabled = 1
            -- support front-matter in .md files
            vim.g.vim_markdown_frontmatter = 1
            -- 'o' on a list item should insert at same level
            vim.g.vim_markdown_new_list_item_indent = 0
            -- don't add bullets when wrapping:
            -- https://github.com/preservim/vim-markdown/issues/232
            vim.g.vim_markdown_auto_insert_bullets = 0
        end
    },
    -- improve handling of white spaces
    {
        "ntpeters/vim-better-whitespace",
        event = "BufRead",
        config = function()
            vim.g.better_whitespace_enabled = 1
            vim.g.strip_whitespace_on_save = 1
            vim.g.strip_whitespace_confirm = 0
            -- Added markdown to blacklist for convenience
            vim.g.better_whitespace_filetypes_blacklist = { "diff", "gitcommit", "unite", "qf", "help", "markdown" }
        end,
    },
    -- Color scheme
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('onedark').setup {
            style = 'warm'
            }
            require('onedark').load()
        end,
    },
    -- commentary key binds and handling
    { "tpope/vim-commentary", event = "VeryLazy" },
    -- Improved formatting on save
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
        {
            "<leader>l",
            function()
            require("conform").format({ async = true, lsp_fallback = true })
            end,
            desc = "Format buffer",
        },
        },
        opts = {
        formatters_by_ft = {
            python = { "ruff_format" },
        },
        format_on_save = true
        },
        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end
    },
    -- make sure parent directories exist when creating files
    { "jessarcher/vim-heritage", event = "VeryLazy" },
    -- show indent lines
    {
        "Yggdroot/indentLine",
        event = "BufReadPre",
        config = function()
            vim.g.indentLine_char = "│"
            vim.g.indentLine_enabled = 1
            -- Adjusted: enable for all filetypes except markdown
            vim.g.indentLine_fileTypeExclude = { "help", "markdown", "text", "terminal" }
        end,
    },
    -- automatic closing pairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
    },
    -- show the registers when it is helpful
    { "junegunn/vim-peekaboo", event = "VeryLazy" },
    -- Rainbow color for parenthesis
    { "luochen1990/rainbow", event = "VeryLazy" },
    -- improved handling of closing buffers
    {
    {
        'mhinz/vim-sayonara',
        cmd = 'Sayonara',
        keys = {
            { "<leader>q", ":Sayonara<CR>", desc = "Close buffer with Sayonara" }
        },
    }
    },
    -- additional targets in text
    { "wellle/targets.vim", event = "VeryLazy" },
    -- improved diagnostic windows
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require("tiny-inline-diagnostic").setup()
            vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
        end,
    },
    -- highlight todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- Treesitter is a new parser generator tool that we can
    -- use in Neovim to power faster and more accurate
    -- syntax highlighting.
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "diff",
                "html",
                "javascript",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "rust",
                "toml",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
            },
            autotag = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufReadPost",
    opts = {
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
            goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup({
            textobjects = opts,
        })
    end,
    },
    { "mg979/vim-visual-multi", branch = "master", event = "VeryLazy" },
    { "bronson/vim-visual-star-search", event = "VeryLazy" },
    -- show key bindings help page
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },
    -- file tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
          "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        cmd = "Neotree",
        keys = {
            {
                "<leader>fe",
                function()
                    require("neo-tree.command").execute({ toggle = true, dir = get_root_dir() })
                end,
                desc = "Explorer NeoTree (Root Dir)",
            },
            {
                "<leader>fE",
                function()
                  require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
                end,
                desc = "Explorer NeoTree (cwd)",
            },
            {
                "<leader>ge",
                function()
                  require("neo-tree.command").execute({ source = "git_status", toggle = true })
                end,
                desc = "Git Explorer",
            },
            {
                "<leader>be",
                function()
                  require("neo-tree.command").execute({ source = "buffers", toggle = true })
                end,
                desc = "Buffer Explorer",
            },
        },
        -- lazy loading handled by cmd and keys, so no need to set lazy = false
        init = function()
            vim.api.nvim_create_autocmd("BufEnter", {
                group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
                desc = "Start Neo-tree with directory",
                once = true,
                callback = function()
                    if package.loaded["neo-tree"] then
                        return
                    else
                        local stats = vim.loop.fs_stat(vim.fn.argv(0))
                        if stats and stats.type == "directory" then
                            require("neo-tree")
                        end
                    end
                end,
            })
        end,
        ---@module 'neo-tree'
        ---@type neotree.Config
        opts = {
            sources = { "filesystem", "buffers", "git_status" },
            open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
                filtered_items = {
                    visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
            },
            window = {
                mappings = {
                    ["l"] = "open",
                    ["h"] = "close_node",
                    ["<space>"] = "none",
                    ["Y"] = {
                        function(state)
                            local node = state.tree:get_node()
                            local path = node:get_id()
                            vim.fn.setreg("+", path, "c")
                        end,
                        desc = "Copy Path to Clipboard",
                    },
                    ["O"] = {
                        function(state)
                            require("lazy.util").open(state.tree:get_node().path, { system = true })
                        end,
                        desc = "Open with System Application",
                    },
                    ["P"] = { "toggle_preview", config = { use_float = false } },
                },
            },
            default_component_configs = {
                indent = {
                    with_expanders = true,
                    expander_collapsed = "▹",
                    expander_expanded = "▿",
                    expander_highlight = "NeoTreeExpander",
                },
            },
        },
        config = function(_, opts)
            local events = require("neo-tree.events")
            opts.event_handlers = opts.event_handlers or {}
            vim.list_extend(opts.event_handlers, {
                { event = events.FILE_MOVED, handler = on_move },
                { event = events.FILE_RENAMED, handler = on_move },
            })
            require("neo-tree").setup(opts)
        end,
    },
})

