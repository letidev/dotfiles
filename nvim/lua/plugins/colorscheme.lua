return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      -- transparent_mode = true,
      contrast = "hard",
      overrides = {
        Normal = { bg = "#1E2021" },
        NormalFloat = { bg = "#1E2021" },
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
