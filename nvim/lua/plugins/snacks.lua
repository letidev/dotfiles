return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        hidden = true, -- show dotfiles
        ignored = true, -- show git-ignored
      },

      picker = {
        hidden = true,
        ignored = true,

        sources = {
          files = { hidden = true, ignored = true },
          explorer = { hidden = true, ignored = true },
        },
      },
    },
  },
}
