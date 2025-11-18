return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "antosha417/nvim-lsp-file-operations",
        config = function()
          require("lsp-file-operations").setup()
        end,
      },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- Show hidden files
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {},
          never_show = {},
        },
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_default",
      },
      window = {
        position = "left",
        width = 32,
      },
      default_component_configs = {
        icon = {
          folder_closed = "▹",
          folder_open = "▿",
          folder_empty = "▿",
        },
      },
      enable_git_status = true,
      enable_diagnostics = false,
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)

      -- Keymaps: <leader>n toggles Neo-tree, <leader>N reveals current file
      vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { silent = true })
      vim.keymap.set("n", "<leader>N", ":Neotree reveal<CR>", { silent = true })

      -- Autocmd: If previous buffer was Neo-tree and more than one window, go back to it
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = function()
          local prev_buf = vim.fn.bufname("#")
          if prev_buf:match("neo%-tree") and vim.fn.winnr("$") > 1 then
            vim.cmd("b#")
          end
        end,
      })
    end,
  },
}