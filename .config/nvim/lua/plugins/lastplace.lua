return {
  {
    "farmergreg/vim-lastplace",
    event = "BufRead",
    config = function()
      vim.g.lastplace_ignore_buftype = "quickfix,nofile,help"
      vim.g.lastplace_ignore_filetype = "gitcommit,gitrebase,svn,hgcommit"
      vim.g.lastplace_open_folds = 1
    end,
  },
}