return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("diffview").setup({})
  end,
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview (git diff)" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    { "<leader>gf", "<cmd>DiffviewFocusFiles<cr>", desc = "Focus Diffview Files" },
    { "<leader>gt", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle Diffview Files" },
  },
}
