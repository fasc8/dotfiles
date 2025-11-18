return {
  {
    "mhinz/vim-sayonara",
    cmd = { "Sayonara" },
    keys = {
      { "<leader>q", ":Sayonara!<CR>", mode = "n", noremap = true, silent = true, desc = "Close buffer (Sayonara)" },
    },
  },
}