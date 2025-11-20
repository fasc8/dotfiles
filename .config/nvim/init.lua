-- Install lazy.nvim if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "  -- Set leader key

-- load plugins in plugins dir
require("lazy").setup("plugins")

-- load lsp keymaps
require("lsp.keymaps")

-- General settings

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.hidden = true
vim.opt.signcolumn = "yes:2"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.spell = true
vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·" }
vim.opt.mouse = "a"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.joinspaces = false
vim.opt.splitright = true
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
vim.opt.splitbelow = true
vim.opt.incsearch = true
vim.opt.gdefault = true
vim.opt.encoding = "utf-8"
vim.opt.foldmethod = "manual"

-- Normal mode keymaps
vim.keymap.set("n", "<leader>ve", ":edit ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", ":nohlsearch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Q", ":bufdo bdelete<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":!xdg-open %<CR><CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>c", ":bd<CR>", { noremap = true, silent = true })
-- TODO: change the two buffer keybinds here?
vim.keymap.set("n", "<leader><left>", ":bp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><right>", ":bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><leader>", "<c-^>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", ":e " .. vim.fn.expand("%:p:h") .. "/", { noremap = true, silent = true })

-- Visual mode keymaps
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "y", "myy`y", { noremap = true, silent = true })
vim.keymap.set("v", "Y", "myY`y", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>p", '"_dP', { noremap = true, silent = true })

-- Insert mode keymaps
vim.keymap.set("i", "jj", "<esc>", { noremap = true })
vim.keymap.set("i", ";;", "<Esc>A;<Esc>", { noremap = true })
vim.keymap.set("i", ",,", "<Esc>A,<Esc>", { noremap = true })

-- Other mode keymaps
vim.keymap.set("n", "Y", "y$", { noremap = true })
vim.keymap.set("n", "n", "nzz", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzz", { noremap = true, silent = true })
vim.keymap.set("n", "*", "*zz", { noremap = true, silent = true })
vim.keymap.set("n", "#", "#zz", { noremap = true, silent = true })
vim.keymap.set("n", "g*", "g*zz", { noremap = true, silent = true })
vim.keymap.set("n", "?", "?\\v", { noremap = true })
vim.keymap.set("n", "/", "/\\v", { noremap = true })
vim.keymap.set("c", "%s/", "%sm/", { noremap = true })
vim.keymap.set("n", "H", "^", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("v", "<C-f>", ":sus<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", ":sus<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>y", ":History:<CR>", { noremap = true, silent = true })

-- Unbind arrow keys
vim.keymap.set("", "<Up>", "<Nop>")
vim.keymap.set("", "<Down>", "<Nop>")
vim.keymap.set("", "<Left>", "<Nop>")
vim.keymap.set("", "<Right>", "<Nop>")

-- For expr mappings, use Lua logic:
vim.keymap.set("n", "j", function()
  return vim.v.count == 0 and "gj" or "j"
end, { expr = true, noremap = true })
vim.keymap.set("n", "k", function()
  return vim.v.count == 0 and "gk" or "k"
end, { expr = true, noremap = true })


-- Custom commands

vim.api.nvim_create_user_command("FixWhitespace", ":%s/\\s\\+$//e", {})
vim.api.nvim_create_user_command("MarkdownTableFix", "! tr -s ' ' | column -t -s '|' -o '|'", { range = true })


-- Autocommands

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Example: remove trailing whitespace on save
    vim.cmd([[%s/\s\+$//e]])
  end,
})
