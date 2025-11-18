return {
  {
    "junegunn/fzf",
    build = "./install --bin",
    event = "VeryLazy",
  },
  {
    "junegunn/fzf.vim",
    event = "VeryLazy",
    config = function()
      vim.g.fzf_layout = { up = "~90%", window = { width = 0.8, height = 0.8, yoffset = 0.5, xoffset = 0.5 } }
      vim.env.FZF_DEFAULT_OPTS = "--layout=reverse --info=inline --bind ctrl-k:preview-up,ctrl-j:preview-down,?:toggle-preview"
      vim.g.fzf_action = {
        ["ctrl-h"] = "split",
        ["ctrl-v"] = "vsplit",
      }

      -- Keymaps
      local map = function(lhs, rhs)
        vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true })
      end
      map("<leader>f", ":FZF<CR>")
      map("<leader>b", ":Buffers<CR>")
      map("<leader>h", ":History<CR>")
      map("<leader>r", ":Rg<CR>")
      map("<leader>R", ":Rg <Space>")
    end,
  },
}