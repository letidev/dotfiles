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

        exclude = { -- add folder names here to exclude
          ".git",
          "node_modules",
        },
      },
    },

    config = function(_, opts)
      require("snacks").setup(opts)

      local function set_snacks_dir_color()
        -- I want directories to have the same color as files
        vim.api.nvim_set_hl(0, "SnacksPickerDirectory", { link = "SnacksPickerFile", nocombine = true })
      end

      -- Apply immediately
      set_snacks_dir_color()

      -- Re-apply when the colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("MySnacksDirColor", { clear = true }),
        callback = set_snacks_dir_color,
      })

      -- Optional: re-apply when Snacks reloads (some builds emit this User event)
      vim.api.nvim_create_autocmd("User", {
        pattern = "SnacksHighlights",
        group = "MySnacksDirColor",
        callback = set_snacks_dir_color,
      })
    end,
  },
}
