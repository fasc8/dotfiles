return {
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
}