return {
  {
    "itchyny/lightline.vim",
    event = "VeryLazy",
    config = function()
      vim.g.lightline = {
        colorscheme = "onedark",
        active = { left = { { "mode", "paste" }, { "readonly", "filename", "modified" } } },
        component_function = { filename = "LightlineFilename" },
      }
    end,
  },
}