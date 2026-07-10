return {
  "folke/snacks.nvim",
  opts = {
    image = { enabled = true },
    picker = {
      sources = {
        explorer = {
          hidden = true, -- show dotfiles by default (toggle with shift+h)
          ignored = true, -- show git-ignored files by default (toggle with shift+i)
        },
      },
    },
    styles = {
      lazygit = {
        width = 0, -- 0 = full width
        height = 0, -- 0 = full height
      },
    },
  },
}
