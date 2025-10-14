return {
  "karb94/neoscroll.nvim",
  event = "WinScrolled",
  config = function()
    require("neoscroll").setup({
      easing_function = "quadratic", -- "quadratic", "cubic", "sine", etc.
      hide_cursor = true,
      respect_scrolloff = true,
      stop_eof = true,
      performance_mode = false,
    })
  end,
}
