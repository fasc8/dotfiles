return {
  {
    "voldikss/vim-floaterm",
    keys = {
      { "<F1>", "<Cmd>FloatermToggle<CR>", mode = { "n", "t" }, desc = "Toggle Floaterm" },
      { "<F2>", "<Cmd>FloatermNext<CR>",   mode = { "n", "t" }, desc = "Next Floaterm" },
      { "<F3>", "<Cmd>FloatermPrev<CR>",   mode = { "n", "t" }, desc = "Prev Floaterm" },
      { "<F4>", "<Cmd>FloatermNew<CR>",    mode = { "n", "t" }, desc = "New Floaterm" },
    },
    config = function()
      vim.g.floaterm_keymap_toggle = "<F1>"
      vim.g.floaterm_keymap_next   = "<F2>"
      vim.g.floaterm_keymap_prev   = "<F3>"
      vim.g.floaterm_keymap_new    = "<F4>"

      vim.g.floaterm_gitcommit = "floaterm"
      vim.g.floaterm_autoinsert = 1
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_wintitle = 0
      vim.g.floaterm_autoclose = 1

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.cmd("highlight FloatermBorder guibg=none")
        end,
        group = vim.api.nvim_create_augroup("FloatermCustomisations", { clear = true }),
      })
    end,
  },
}