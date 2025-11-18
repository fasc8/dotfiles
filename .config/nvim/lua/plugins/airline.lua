return {
  {
    "vim-airline/vim-airline",
    lazy = false,
    init = function()
      -- Theme and basic options
      vim.g.airline_theme = "onedark"
      vim.g.airline_powerline_fonts = 1
      vim.g.airline_skip_empty_sections = 1

      -- Hide default mode text
      vim.opt.showmode = false
    end,
    dependencies = {
      { "vim-airline/vim-airline-themes", lazy = false },
    },
  },
}