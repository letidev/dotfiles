return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = true,
      on_highlights = function(hl)
        hl.SnacksPicker = { bg = "none", nocombine = true }
      end,
    },
  },
}
