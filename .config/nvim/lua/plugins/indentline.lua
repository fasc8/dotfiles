return {
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
}